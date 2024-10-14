import 'package:flutter_clean_arch_generator/domain/entity/utils/entity_item.dart';
enum BaseResponseNames {
  baseResponse(currentName: "BaseResponse"),
  basePaginationResponse(currentName: "BasePaginationResponse"),
  baseListResponse(currentName: "BaseListResponse");
 final String currentName;
  const BaseResponseNames({required this.currentName});
}
class MethodItem {
  final String methodName;
  final Type params;
  final BaseResponseNames response;
  final EntityItem responseEntity;
  final bool isLocalData;
  final bool isCachedResponse;


  MethodItem({
    required this.methodName,
    required this.params,
    required this.response,
    required this.responseEntity,
    this.isLocalData = false,
    this.isCachedResponse = false,
  });

  String get responseName => response.currentName;
  String get baseResponseType => responseEntity.toString();
  String get paramsName => params.toString();

}