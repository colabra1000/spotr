import 'package:equatable/equatable.dart';
import 'package:spotr/core/errors/errorTypes.dart';

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
}
