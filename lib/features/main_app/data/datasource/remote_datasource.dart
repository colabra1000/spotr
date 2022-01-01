import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDatasource {}

class AutnhenticationDatasourceImpl implements RemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AutnhenticationDatasourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});
}
