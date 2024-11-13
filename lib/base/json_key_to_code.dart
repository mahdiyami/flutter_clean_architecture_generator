

import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/base/base_property.dart';
import 'package:json_annotation/json_annotation.dart';

mixin JsonSerializableToCode {
  Expression jsonKeyToCode(CleanArchGenJsonKey jsonKey) {
    return refer('JsonKey').call(
      [],
      {
        if (jsonKey.name != null) 'name': literal(jsonKey.name!),
        if (jsonKey.includeFromJson != null) 'includeFromJson': literal(jsonKey.includeFromJson!),
        if (jsonKey.includeToJson != null) 'includeToJson': literal(jsonKey.includeToJson!),
        if (jsonKey.fromJson != null) 'fromJson': refer(jsonKey.fromJson!),
        if (jsonKey.toJson != null) 'toJson': refer(jsonKey.toJson!),
      },
    );
  }
}