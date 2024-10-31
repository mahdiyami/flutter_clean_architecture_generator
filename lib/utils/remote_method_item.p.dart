part of 'base_method.dart';

enum BaseResponseNames {
  baseResponse(currentName: "BaseResponse"),
  basePaginationResponse(currentName: "BasePaginationResponse"),
  baseListResponse(currentName: "BaseListResponse"),
  noResponse(currentName: "NoResponse");

  final String currentName;

  const BaseResponseNames({required this.currentName});
}

class RemoteMethodItem extends BaseMethodItem {
  
  RemoteDataSettings settings;

  RemoteMethodItem({
    required super.methodName,
    required super.params,
    required super.response,
    required super.responseEntity,
      super.isFuture,
    required this.settings,
  });

}
