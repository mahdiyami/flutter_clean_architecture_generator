import 'lib/base_export.dart';

@baseParamsFreezed()
class CheckAuthParams extends BaseParams with _$CheckAuthParams {
  const CheckAuthParams._() : super();

  factory CheckAuthParams({
    required String id,
    required bool isRegistered,
    required bool hasPassword,
  }) = _CheckAuthparams;

  factory CheckAuthParams.fromJson(Map<String, dynamic> json) {
    return _$CheckAuthParamsImplFromJson(json);
  }
}
