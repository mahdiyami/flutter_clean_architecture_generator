import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_generator/base/base_property.dart';

class CleanArchEntityItem {
  final bool abstractOnly;
  final Either<CleanArchEntityItem , Type>? extendsEntity;
  final String entityName;
  final List<EntityProperty> entityParams;

  const CleanArchEntityItem({required this.entityName, required this.entityParams , this.abstractOnly = false , this.extendsEntity});

  @override
  String toString() {
    return '${entityName}Entity';
  }
  String get extendsEntityName {
    return extendsEntity?.fold((l) => l.toString(), (r) => r.toString()) ?? '';
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
