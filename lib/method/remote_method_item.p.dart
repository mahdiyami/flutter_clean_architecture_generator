part of 'base_method.dart';

enum BaseResponseNames {
  baseResponse(currentName: "BaseResponse"),
  basePaginationResponse(currentName: "BasePaginationResponse"),
  baseListResponse(currentName: "BaseListResponse"),
  baseTypeResponse(currentName: "BaseTypeResponse"),
  noResponse(currentName: "NoResponse");

  final String currentName;

  const BaseResponseNames({required this.currentName});
}

class RemoteMethodItem extends BaseMethodItem {
  
  RemoteDataSettings settings;

  RemoteMethodItem({
    required super.methodName,
      super.params,
      super.pathParams,
    required super.response,
    required super.responseEntity,
      super.isFuture,
    required this.settings,
  });

}
