import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_service.dart';

part 'api_service.dart';
part 'local_service.dart';

enum BaseResponseNames {
  baseResponse(currentName: "BaseResponse"),
  basePaginationResponse(currentName: "BasePaginationResponse"),
  baseListResponse(currentName: "BaseListResponse"),
  noResponse(currentName: "NoResponse");

  final String currentName;

  const BaseResponseNames({required this.currentName});
}

class MethodItem<T extends BaseService> {
  final String methodName;
  final Type params;
  final BaseResponseNames response;
  final CleanArchEntityItem responseEntity;
  T serviceSettings;
  final bool isFuture;
  final bool isCachedResponse;

  MethodItem({
    required this.methodName,
    required this.params,
    required this.response,
    required this.responseEntity,
    required this.serviceSettings,
    this.isFuture = true,
    this.isCachedResponse = false,
  });

  String get responseName => response.currentName;
  String get baseResponseType => responseEntity.toString();
  String get baseResponseTypeModel => responseEntity.toString().replaceAll("Entity", 'Model');
  String get paramsName => params.toString();
}
