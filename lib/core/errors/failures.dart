import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:spotr/core/errors/errorTypes.dart';
import 'package:spotr/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  final String? message;
  final dynamic code;
  final ErrorTypes? errorTypes;
  const Failure({this.message, this.code, this.errorTypes});

  @override
  List<Object?> get props => [message, code, errorTypes];
}

class ServerFailure extends Failure {
  const ServerFailure({message, code, errorTypes})
      : super(message: message, code: code, errorTypes: errorTypes);

  factory ServerFailure.handleServerFailureException(e) {
    ServerFailure serverFailure;
    if (e is FirebaseException) {
      print(e.code);

      serverFailure = ServerFailure(
          message: e.message,
          code: e.code,
          errorTypes: _mapFireBaseExceptionErrorToErrorType(e.code));
    } else if (e is ServerException) {
      serverFailure = ServerFailure(
          message: e.message, code: e.code, errorTypes: e.errorTypes);
    } else {
      serverFailure = ServerFailure(message: e.toString());
    }

    return serverFailure;
  }

  static ErrorTypes _mapFireBaseExceptionErrorToErrorType(String code) {
    switch (code.toLowerCase()) {
      case "wrong-password":
        return ErrorTypes.wrongPassword;
      case "email-already-in-use":
        return ErrorTypes.emailAlreadyInUse;
      case "network-request-failed":
        return ErrorTypes.networkError;
      case "user-not-found":
        return ErrorTypes.emailNotRegistered;

      default:
        return ErrorTypes.unKnown;
    }
  }
}
