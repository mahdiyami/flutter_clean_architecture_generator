import 'lib/base_export.dart';

class AuthCheckModel extends AuthCheckEntity with _$UserModel implements BaseModel {
  const AuthCheckModel._() : super();

  factory AuthCheckModel({
    required String id,
    required String name,
    required String password,
    required String phone,
    required AddressEntity address,
    required String avatar,
    required String role,
    required String status,
    required String createdAt,
    required String updatedAt,
  }) = _UserModel;

  static UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelImplFromJson(json);
  }
}
