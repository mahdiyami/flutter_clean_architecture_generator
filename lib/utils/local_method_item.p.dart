part of 'base_method.dart';

class LocalMethodItem extends BaseMethodItem {
  LocalDataSettings settings;

  LocalMethodItem({
    required super.methodName,
    required super.params,
    required super.response,
    required super.responseEntity,
    required super.isFuture,
    required this.settings,
  });
}
