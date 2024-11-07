import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ModelCreator extends BaseModelCreator {

  @override
  Class createClass(CleanArchEntityItem item) {
    return Class((b) => b
      ..annotations.add(refer(modelAnnotation))
      ..name = modelName(item.entityName)
      ..extend = refer(entityName(item.entityName))
      ..mixins.add(refer(modelFreezedMixinName(item.entityName)))
      ..implements.add(refer(baseModelName))
      ..constructors.add(Constructor((b) => b
        ..constant = true
        ..name = '_'
        ..initializers.add(Code('super()'))))
      ..constructors.add(Constructor((b) => b
        ..factory = true
        ..constant = true

        ..optionalParameters.addAll(_entityParams(params: item.entityParams))
        ..redirect = refer(modelConstructorFreezedMixinName(item.entityName))))
      ..constructors.add(Constructor((b) => b
        ..factory = true
        ..name = 'fromJson'
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'json'
          ..type = refer('Map<String, dynamic>')))
        ..body = Code('return ${modelFromJsonMethodName(item)}(json);'))));
  }

  List<Parameter> _entityParams({required List<EntityProperty> params}) {
    return params
        .map(
          (e) => Parameter((b) {
            if (e.jsonKey != null) {
              b.annotations.add(
                  jsonKeyToCode(e.jsonKey!)
              );
            }

            b
              ..name = e.objectNameKey
              ..named = true
              ..type = refer(e.convertObjectTypeEntityToModel)
              ..required = !e.nullable;
          }),
        )
        .toList();
  }
}
