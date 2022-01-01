import '../datasource/remote_datasource.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  RemoteDatasource remoteDatasource;
  AuthenticationRepositoryImpl({required this.remoteDatasource});
}
