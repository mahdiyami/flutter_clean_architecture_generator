import 'lib/base_export.dart';

abstract class AuthRepository extends RepositoryUtils {
  FutureOr<Either<Failure, BaseResponse<CheckAuthEntity>>> checkAuth(CheckAuthParams params);
  FutureOr<Either<Failure, BaseResponse<CheckAuthEntity>>> token(bool params);
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> user(CheckAuthParams params);
  FutureOr<Either<Failure, NoResponse>> confirmAuth(CheckAuthParams params);
}
