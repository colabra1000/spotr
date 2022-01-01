import 'package:spotr/core/errors/errorTypes.dart';

class ServerException implements Exception {
  String? message;
  int? code;
  ErrorTypes? errorTypes;
  ServerException({this.message, this.code, this.errorTypes});
}
