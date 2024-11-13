import 'lib/base_export.dart';

@baseModelFreezed()
class UserModel extends UserEntity with _$UserModel implements BaseModel {
  const UserModel._() : super();

  factory UserModel({
    required String id,
    required String name,
    required String password,
    required String phone,
    required AddressModel address,
    required String avatar,
    required String role,
    required String status,
    required String createdAt,
    required String updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelImplFromJson(json);
  }
}
