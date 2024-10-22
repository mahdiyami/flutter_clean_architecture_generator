import 'package:flutter_clean_arch_generator/base/base_property.dart';

class CleanArchParamsItem {
  final String paramsName;
  final List<ParamsProperty> paramsProperty;

  const CleanArchParamsItem({required this.paramsName, required this.paramsProperty});

  @override
  String toString() {
    return '${paramsName}Params';
  }
}

class ParamsProperty extends BaseProperty {
  const ParamsProperty({required Object objectType, required super.objectNameKey, super.jsonKey, super.nullable}) : super(objectType);
}
