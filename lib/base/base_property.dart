import 'package:json_annotation/json_annotation.dart' show JsonKey;

abstract class BaseProperty {
  final Object _objectType;
  final String objectNameKey;
  final JsonKey? jsonKey;
  final bool nullable;

  const BaseProperty(this._objectType , { required this.objectNameKey, this.jsonKey, this.nullable = false});

  String get objectTypeToString {
    if (nullable) {
      return '${_objectType.toString()}?';
    } else {
      return '${_objectType.toString()}';
    }
  }
}
