import 'lib/base_export.dart';

abstract class AuthRepository extends RepositoryUtils {
  FutureOr<Either<Failure, BaseResponse<CheckAuthEntity>>> checkAuth(String params);
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> confirmAuth(String params);
}
