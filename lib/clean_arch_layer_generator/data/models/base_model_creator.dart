import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/base/json_key_to_code.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseModelCreator with CleanArchClassGenUtils , JsonSerializableToCode {
  Class createClass(CleanArchEntityItem item);


  String get baseEntityName => 'BaseEntity';
  String get baseModelName => 'BaseModel';
  String get modelAnnotation => "baseModelFreezed";

  List<String> partDirective(CleanArchEntityItem item) =>
      ['${fileModelName(item.entityName)}.g.dart', '${fileModelName(item.entityName)}.freezed.dart'];

  String modelFromJsonMethodName(CleanArchEntityItem item) => '_\$\$${modelName(item.entityName)}ImplFromJson';
  String modelConstructorFreezedMixinName(String entityName) {
    return '_${entityName.firstLetterUpperCase}Model';
  }

  String modelFreezedMixinName(String entityName) {
    return '_\$${entityName.firstLetterUpperCase}Model';
  }
}
