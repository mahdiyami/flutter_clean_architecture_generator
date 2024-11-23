part of 'base_method.dart';

class LocalMethodItem extends BaseMethodItem {
  LocalDataSettings settings;

  LocalMethodItem({
    required super.methodName,
      super.params,
      super.pathParams,
    required super.response,
    required super.responseEntity,
    super.isFuture,
    required this.settings,
  });

  LocalMethodItem copyWith({
    String? methodName,
    Either<CleanArchParamsItem, Type>? params,
    Either<CleanArchParamsItem, Type>? pathParams,
    BaseResponseNames? response,
    ResponseEntity? responseEntity,
    bool? isFuture,
    LocalDataSettings? settings,
  }) {
    return LocalMethodItem(
      methodName: methodName ?? super.methodName,
      params: params ?? super.params,
      pathParams: pathParams ?? super.pathParams,
      response: response ?? super.response,
      responseEntity: responseEntity ?? super.responseEntity,
      isFuture: isFuture ?? super.isFuture,
      settings: settings ?? this.settings,
    );
  }
}
