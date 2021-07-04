
import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/error/failures.dart';
import 'package:SchoolManagementSystem/core/network/network_info.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/data_sources/login_local_data_source.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/data_sources/login_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/models/login_data.dart';
import 'package:SchoolManagementSystem/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final LoginLocalDataSource loginLocalDataSource;
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl(
      { this.networkInfo,
        this.loginLocalDataSource,
        this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginData>> getCurrentUser() {
    return _getUser();
  }

  @override
  Future<Either<Failure, LoginData>> postLogin(String email, String pass) {
    return _login(loginRemoteDataSource.login(email, pass));
  }

  Future<Either<Failure, LoginData>> _getUser() async {
    try {
      final result = await loginLocalDataSource.getLogin();
      return Right(result);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginData>> _login(Future<LoginData> loginInfo) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await loginInfo;
        loginLocalDataSource.saveLogin(result);
        _getUser();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
