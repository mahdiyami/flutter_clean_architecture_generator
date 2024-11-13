import 'lib/base_export.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRepositoryImpl extends AuthRemoteDataSource {
  Either<Failure, BaseResponse<CheckAuthEntity>> checkAuth(CheckAuthParams params) => appRequest.get(
        "/checkAuth",
        fromJson: (json) => BaseResponse.fromJson(json as Map<String, dynamic>, (json) => CheckAuthModel.fromJson(json as Map<String, dynamic>)),
      );

  Either<Failure, NoResponse> confirmAuth(CheckAuthParams params) => appRequest.post(
        "/confirmAuth",
        fromJson: (json) => NoResponse.fromJson(json as Map<String, dynamic>),
      );
}
