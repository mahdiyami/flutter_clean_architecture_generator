import 'package:json_annotation/json_annotation.dart' show JsonKey;


class CleanArchEntityItem {
  final String entityName;
  final List<EntityParams> entityParams;

  CleanArchEntityItem({required this.entityName, required this.entityParams});

  @override
  String toString() {
    return '${entityName}Entity';
  }
}

class EntityParams {
  final Object objectType;
  final String objectNameKey;
  final JsonKey? jsonKey;
  final bool nullable;

  EntityParams({required this.objectType, required this.objectNameKey, this.jsonKey, this.nullable = false});
}

extension OnEntityParams on EntityParams {
  String get convertObjectTypeEntityToModel {
    return objectType.toString().replaceAll('Entity', 'Model');
  }



}