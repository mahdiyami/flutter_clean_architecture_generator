import 'lib/base_export.dart';

class AuthCheckModel extends AuthCheckEntity with _$CheckAuthModel implements BaseModel {
  const AuthCheckModel._() : super();

  factory AuthCheckModel({
    required String id,
    required bool isRegistered,
    required bool hasPassword,
    UserEntity user,
  }) = _CheckAuthModel;

  static CheckAuthModel fromJson(Map<String, dynamic> json) {
    return _$CheckAuthModelImplFromJson(json);
  }
}
