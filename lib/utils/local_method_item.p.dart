part of 'base_method.dart';

class LocalMethodItem extends BaseMethodItem {
  LocalDataSettings settings;

  LocalMethodItem({
    required super.methodName,
    required super.params,
    required super.response,
    required super.responseEntity,
    super.isFuture,
    required this.settings,
  });

  LocalMethodItem copyWith({
    String? methodName,
    Either<CleanArchParamsItem, Type>? params,
    BaseResponseNames? response,
    Either<CleanArchEntityItem, Type>? responseEntity,
    bool? isFuture,
    LocalDataSettings? settings,
  }) {
    return LocalMethodItem(
      methodName: methodName ?? super.methodName,
      params: params ?? super.params,
      response: response ?? super.response,
      responseEntity: responseEntity ?? super.responseEntity,
      isFuture: isFuture ?? super.isFuture,
      settings: settings ?? this.settings,
    );
  }
}
