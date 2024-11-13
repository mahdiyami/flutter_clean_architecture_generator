import 'lib/base_export.dart';

abstract class CartRemoteDataSource {
  BaseResponse<CheckAuthModel> addToCart(CheckAuthParams params);
  BaseResponse<UserModel> removeFromCart(CheckAuthParams params);
}
