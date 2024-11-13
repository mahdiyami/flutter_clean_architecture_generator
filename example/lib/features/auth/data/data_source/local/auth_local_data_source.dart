import 'lib/base_export.dart';

abstract class AuthRemoteDataSource {
  FutureOr<void> saveToken(bool params);
  FutureOr<bool> getToken();
  FutureOr<void> removeToken();
  FutureOr<void> saveUser(CheckAuthParams params);
  FutureOr<CheckAuthParams> getUser();
  FutureOr<void> removeUser();
}
