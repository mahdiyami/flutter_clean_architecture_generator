import 'package:json_annotation/json_annotation.dart' show JsonKey;


class RepositoryItem {
  final String entityName;
  final List<RepositoryParams> entityParams;

  RepositoryItem({required this.entityName, required this.entityParams});

  @override
  String toString() {
    return '${entityName}Repository';
  }
}

class RepositoryParams {
  final Object objectType;
  final String objectNameKey;
  final JsonKey? jsonKey;
  final bool nullable;

  RepositoryParams({required this.objectType, required this.objectNameKey, this.jsonKey, this.nullable = false});
}