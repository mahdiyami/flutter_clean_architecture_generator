import 'lib/base_export.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this.authRemoteDataSource,
    this.authLocalDataSource,
  );

  final AuthRemoteDataSource authRemoteDataSource;

  final AuthLocalDataSource authLocalDataSource;

  Either<Failure, BaseResponse<CheckAuthEntity>> checkAuth(CheckAuthParams params) {
    return performSync(() {
      return authRemoteDataSource.checkAuth(params);
    });
  }

  Either<Failure, BaseResponse<CheckAuthEntity>> token(bool params) {
    return performSync(() {
      return authLocalDataSource.token(params);
    });
  }

  Either<Failure, BaseResponse<UserEntity>> user(CheckAuthParams params) {
    return performSync(() {
      return authLocalDataSource.user(params);
    });
  }

  Either<Failure, NoResponse> confirmAuth(CheckAuthParams params) {
    return performSync(() {
      return authRemoteDataSource.confirmAuth(params);
    });
  }
}
