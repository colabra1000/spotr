import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/dto/login_request.dart';
import '../../../../core/dto/register_request.dart';
import '../../../../core/errors/errorTypes.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user_info.dart' as entity;

abstract class RemoteDatasource {
  Future<String> registerUser({required RegisterRequest registerRequest});

  Future<String> loginUser({required LoginRequest loginRequest});

  Stream<User?> listenToUserLoginStatus();

  Stream<DocumentSnapshot<Object?>> listenToUserInfo();

  Future<String> sendVerificationEmail();
  Future<String> sendPasswordResetLink(String email);

  Stream<bool> checkEmailVerificationStatus(int delayInSeconds);
}

class AutnhenticationDatasourceImpl implements RemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  User? user;

  AutnhenticationDatasourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore}) {
    //listen to userLogin Status.
    _listenToUserLoginStatus();
  }

  @override
  Future<String> registerUser(
      {required RegisterRequest registerRequest}) async {
    //check for unique fields.
    //username and phonenumbers.

    CollectionReference userInfo = firebaseFirestore.collection('user_info');
    //try and get username
    await _checkAndThrowErrorIfUsernameIsNotUnique(
        "username", registerRequest.username, userInfo);
    await _checkAndThrowErrorIfPhoneNumberIsNotUnique(
        "phone_number", registerRequest.phoneNumber, userInfo);

    //automatically checks for unique email.
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
            email: registerRequest.email, password: registerRequest.password);

    await userInfo
        .doc(userCredential.user!.uid)
        .set({registerRequest.toJson()});

    return "success";
  }

  @override
  Future<String> loginUser({required LoginRequest loginRequest}) async {
    //go to user_info and retrieve the email.
    CollectionReference userInfo = firebaseFirestore.collection('user_info');
    //try and get username
    QuerySnapshot querySnapshot = await userInfo
        .where("username", isEqualTo: loginRequest.usernameOrPhoneNumber)
        .get();
    //try and get phone number
    if (querySnapshot.docs.isEmpty) {
      querySnapshot = await userInfo
          .where("phone_number", isEqualTo: loginRequest.usernameOrPhoneNumber)
          .get();
    }

    //if not found.
    if (querySnapshot.docs.isEmpty) {
      throw ServerException(
          message: "user not found", errorTypes: ErrorTypes.userDoesNotExist);
    }

    //else check if verified
    bool? verified = querySnapshot.docs.first['verified'];
    if (verified == false) {
      throw ServerException(
          message: "user not verified", errorTypes: ErrorTypes.userNotVerified);
    }

    //then use the email to sign in.
    String? email = querySnapshot.docs.first['email'];
    await firebaseAuth.signInWithEmailAndPassword(
        email: email ?? "", password: loginRequest.password);

    return "success";
  }

  @override
  Stream<User?> listenToUserLoginStatus() {
    return firebaseAuth.userChanges();
  }

  @override
  Stream<DocumentSnapshot<Object?>> listenToUserInfo() {
    if (user == null) {
      throw ServerException(errorTypes: ErrorTypes.userNotSignedIn);
    }

    CollectionReference userInfo = firebaseFirestore.collection('user_info');
    return userInfo.doc(user!.uid).snapshots();

    // .listen((event) {
    //   Map<String, dynamic> data = event.data() as Map<String, dynamic>;

    //    entity.UserInfo userInfo = entity.UserInfo(
    //       email: email,
    //       interests: interests,
    //       phoneNumber: phoneNumber,
    //       username: username,
    //       verified: verified);
    // });
  }

  @override
  Future<String> sendVerificationEmail() async {
    if (user == null) {
      throw ServerException(
          message: "user must sign in", errorTypes: ErrorTypes.userNotSignedIn);
    }

    if (user!.emailVerified) {
      await _setUserVerificationToTrue(user!.uid);
      throw ServerException(
          message: "email is already verified",
          errorTypes: ErrorTypes.emailAlreadyVerified);
    }

    await user!.sendEmailVerification();

    return "success";
  }

  @override
  Future<String> sendPasswordResetLink(String email) async {
    print("email sent");
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return "success";
  }

  @override
  Stream<bool> checkEmailVerificationStatus(int delayInSeconds) async* {
    while (true) {
      await user?.reload();

      if (user == null) {
        throw ServerException(
            message: "user must sign in",
            errorTypes: ErrorTypes.userNotSignedIn);
      }

      if (user!.emailVerified) {
        await _setUserVerificationToTrue(user!.uid);
        yield true;
      } else {
        yield false;
      }

      await Future.delayed(Duration(seconds: delayInSeconds));
    }
  }

  void _listenToUserLoginStatus() {
    listenToUserLoginStatus().listen((event) {
      user = event;
    });
  }

  Future<void> _setUserVerificationToTrue(String uid) async {
    return await firebaseFirestore
        .collection("user_info")
        .doc(uid)
        .update({"verified": true});
  }

  Future<void> _checkAndThrowErrorIfUsernameIsNotUnique(
      String label, String username, CollectionReference userInfo) async {
    QuerySnapshot querySnapshot =
        await userInfo.where(label, isEqualTo: username).get();

    if (querySnapshot.docs.isNotEmpty) {
      throw ServerException(
          message: "user_name_already_exists",
          errorTypes: ErrorTypes.userNameAlreadyInUse);
    }
  }

  Future<void> _checkAndThrowErrorIfPhoneNumberIsNotUnique(
      String label, String phoneNumber, CollectionReference userInfo) async {
    QuerySnapshot querySnapshot =
        await userInfo.where(label, isEqualTo: phoneNumber).get();

    if (querySnapshot.docs.isNotEmpty) {
      throw ServerException(
          message: "phone_number_already_exists",
          errorTypes: ErrorTypes.phoneNumberAlreadyInUse);
    }
  }
}
