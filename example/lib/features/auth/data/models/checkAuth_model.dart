import 'lib/base_export.dart';

@baseModelFreezed()
class CheckAuthModel extends CheckAuthEntity with _$CheckAuthModel implements BaseModel {
  const CheckAuthModel._() : super();

  factory CheckAuthModel({
    required String id,
    required bool isRegistered,
    required bool hasPassword,
    UserModel? user,
  }) = _CheckAuthModel;

  factory CheckAuthModel.fromJson(Map<String, dynamic> json) {
    return _$CheckAuthModelImplFromJson(json);
  }
}
