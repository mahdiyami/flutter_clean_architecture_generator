import 'package:json_annotation/json_annotation.dart' show JsonKey;


class EntityItem {
  final String entityName;
  final List<EntityParams> entityParams;

  EntityItem({required this.entityName, required this.entityParams});

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