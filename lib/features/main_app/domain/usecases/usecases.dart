import 'package:dartz/dartz.dart';
import 'package:spotr/core/errors/failures.dart';

abstract class UseCases<Type, P> {
  Future<Either<Failure, Type>> call(P params);
}
