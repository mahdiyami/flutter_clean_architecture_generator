import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/base_params_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/utils/params_item.dart';

class ParamsCreator extends BaseParamsCreator {

  @override
  Class createClass(CleanArchParamsItem item) {

    return Class((b) => b
      ..annotations.add(refer(modelAnnotation).call([]))
      ..name = paramsName(item.paramsName)
      ..extend = refer(baseParamsName(item))
      ..mixins.add(refer(paramsFreezedMixinName(item.paramsName)))
      ..constructors.add(Constructor((b) => b
        ..constant = true
        ..name = '_'
        ..initializers.add(Code('super()'))
      ))
      ..constructors.add(Constructor((b) => b
        ..factory = true
        ..optionalParameters.addAll(_entityParams(params: item.paramsProperty))
        ..redirect = refer(paramsConstructorFreezedMixinName(item.paramsName))
      ))
      ..constructors.add(Constructor((b) => b
        ..factory = true
        ..name = 'fromJson'
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'json'
          ..type = refer('Map<String, dynamic>')))
        ..body = Code('return ${paramsFromJsonMethodName(item)}(json);')
      ))
    );


  }

  List<Parameter> _entityParams({required List<ParamsProperty> params}) {
    return params
        .map((e) => Parameter((b) => b
      ..name = e.objectNameKey
      ..named = true
       ..type = refer(e.objectTypeToString)
        ..required = !e.nullable
    ),
    )
        .toList();
  }
}


