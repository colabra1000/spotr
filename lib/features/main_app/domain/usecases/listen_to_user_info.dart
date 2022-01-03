import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/main_app_repository.dart';
import 'usecases.dart';

class ListenToUserInfo
    implements UseCases<Stream<DocumentSnapshot<Object?>>, dynamic> {
  MainAppRepository repository;

  ListenToUserInfo({required this.repository});

  @override
  Future<Either<Failure, Stream<DocumentSnapshot<Object?>>>> call(
      params) async {
    return repository.listenToUserInfo();
  }
}
