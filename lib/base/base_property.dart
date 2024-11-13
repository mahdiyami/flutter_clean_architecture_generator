
abstract class BaseProperty {
  final Object _objectType;
  final String objectNameKey;
  final CleanArchGenJsonKey? jsonKey;
  final bool nullable;

  const BaseProperty(this._objectType, {required this.objectNameKey, this.jsonKey, this.nullable = false});

  String get objectTypeToString {
    if (nullable) {
      return '${_objectType.toString()}?';
    } else {
      return '${_objectType.toString()}';
    }
  }
}

class CleanArchGenJsonKey {
  final String? name;
  final bool? includeFromJson;
  final bool? includeToJson;
  final String? fromJson;
  final String? toJson;

  const CleanArchGenJsonKey({this.name, this.includeFromJson, this.includeToJson, this.fromJson, this.toJson});
}
