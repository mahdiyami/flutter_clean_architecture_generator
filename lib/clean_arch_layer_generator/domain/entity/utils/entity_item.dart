import 'package:flutter_clean_arch_generator/base/base_property.dart';

class CleanArchEntityItem {
  final String entityName;
  final List<EntityProperty> entityParams;

  const CleanArchEntityItem({required this.entityName, required this.entityParams});

  @override
  String toString() {
    return '${entityName}Entity';
  }
}

class EntityProperty extends BaseProperty {
  const EntityProperty({required Object objectType, required super.objectNameKey, super.jsonKey, super.nullable}) : super(objectType);
}

extension OnEntityParams on EntityProperty {
  String get convertObjectTypeEntityToModel {
    return objectTypeToString.replaceAll('Entity', 'Model');
  }
}
