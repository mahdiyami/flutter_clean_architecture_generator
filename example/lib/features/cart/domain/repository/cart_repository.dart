import 'lib/base_export.dart';

abstract class CartRepository extends RepositoryUtils {
  FutureOr<Either<Failure, BaseResponse<CheckAuthEntity>>> addToCart(CheckAuthParams params);
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> removeFromCart(CheckAuthParams params);
}
