import 'lib/base_export.dart';

abstract class AuthRemoteDataSource {
  BaseResponse<CheckAuthModel> checkAuth(CheckAuthParams params);
  NoResponse confirmAuth(CheckAuthParams params);
}
