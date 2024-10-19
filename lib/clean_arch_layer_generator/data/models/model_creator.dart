import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ModelCreator extends BaseModelCreator {
  ModelCreator({required super.feature});

  @override
  Class createClass(CleanArchEntityItem item) {

    return Class((b) => b
      ..annotations.add(refer(modelAnnotation).call([]))
      ..name = modelName(item.entityName)
      ..extend = refer(entityName(item.entityName))
      ..mixins.add(refer(modelFreezedMixinName(item.entityName)))
      ..implements.add(refer(baseModelName))
      ..constructors.add(Constructor((b) => b
        ..constant = true
        ..name = '_'
        ..initializers.add(Code('super()'))
      ))
      ..constructors.add(Constructor((b) => b
        ..factory = true
        ..optionalParameters.addAll(_entityParams(params: item.entityParams))
        ..redirect = refer(modelConstructorFreezedMixinName(item.entityName))
      ))
      ..methods.add(Method((b) => b
        ..name = 'fromJson'
        ..static = true
        ..returns = refer(modelName(item.entityName))
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'json'
          ..type = refer('Map<String, dynamic>')))
        ..body = Code('return ${modelFromJsonMethodName(item)}(json);')
      ))
    );


  }

  List<Parameter> _entityParams({required List<EntityParams> params}) {
    return params
        .map((e) => Parameter((b) => b
      ..name = e.objectNameKey
      ..named = true
      //create function for handle nullable
      ..type = refer(e.convertObjectTypeEntityToModel)
        ..required = !e.nullable
      // ..annotations.add(refer('required'))
    ),
    )
        .toList();
  }
}


