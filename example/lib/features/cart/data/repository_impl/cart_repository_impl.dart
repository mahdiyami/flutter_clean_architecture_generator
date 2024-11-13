import 'lib/base_export.dart';

class CartRepositoryImpl extends CartRepository {
  CartRepositoryImpl(this.cartRemoteDataSource);

  final CartRemoteDataSource cartRemoteDataSource;

  Either<Failure, BaseResponse<CheckAuthEntity>> addToCart(CheckAuthParams params) {
    return performSync(() {
      return cartRemoteDataSource.addToCart(params);
    });
  }

  Either<Failure, BaseResponse<UserEntity>> removeFromCart(CheckAuthParams params) {
    return performSync(() {
      return cartRemoteDataSource.removeFromCart(params);
    });
  }
}
