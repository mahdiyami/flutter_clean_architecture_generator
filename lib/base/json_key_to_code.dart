

import 'package:code_builder/code_builder.dart';
import 'package:json_annotation/json_annotation.dart';

mixin JsonSerializableToCode {
  Expression jsonKeyToCode(JsonKey jsonKey) {
    return refer('JsonKey').call(
      [],
      {
        if (jsonKey.name != null) 'name': literal(jsonKey.name!),
        if (jsonKey.includeFromJson != null) 'includeFromJson': literal(jsonKey.includeFromJson!),
        if (jsonKey.includeToJson != null) 'includeToJson': literal(jsonKey.includeToJson!),
        if (jsonKey.fromJson != null) 'fromJson': refer(jsonKey.fromJson!.toString()),
        if (jsonKey.toJson != null) 'toJson': refer(jsonKey.toJson!.toString()),
      },
    );
  }
}