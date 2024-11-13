import 'lib/base_export.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRepositoryImpl extends CartRemoteDataSource {
  Either<Failure, BaseResponse<CheckAuthEntity>> addToCart(CheckAuthParams params) => appRequest.post(
        "/addToCart",
        fromJson: (json) => BaseResponse.fromJson(json as Map<String, dynamic>, (json) => CheckAuthModel.fromJson(json as Map<String, dynamic>)),
      );

  Either<Failure, BaseResponse<UserEntity>> removeFromCart(CheckAuthParams params) => appRequest.post(
        "/removeFromCart",
        fromJson: (json) => BaseResponse.fromJson(json as Map<String, dynamic>, (json) => UserModel.fromJson(json as Map<String, dynamic>)),
      );
}
