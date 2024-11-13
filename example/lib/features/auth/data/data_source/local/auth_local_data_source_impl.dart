import 'lib/base_export.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  const AuthLocalDataSourceImpl();

  static const String _tokenCacheKey = "_tokenCacheKey";

  static const String _userCacheKey = "_userCacheKey";

  @override
  Future<void> saveToken(bool params) async {
    await localRequest.saveData<bool>(value: params, key: _tokenCacheKey);
  }

  @override
  bool getToken() {
    final data = localRequest.getData<bool>(_tokenCacheKey);
    return data;
  }

  @override
  Future<void> removeToken() {
    return localRequest.removeData(_tokenCacheKey);
  }

  @override
  Future<void> saveUser(CheckAuthParams params) async {
    await localRequest.saveData<String>(value: jsonEncode(params.toJson()), key: _userCacheKey);
  }

  @override
  String getUser() {
    final data = localRequest.getData<String>(_userCacheKey);
    return jsonDecode(data);
  }

  @override
  Future<void> removeUser() {
    return localRequest.removeData(_userCacheKey);
  }
}
