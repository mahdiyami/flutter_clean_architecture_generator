import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ModelCreator extends BaseModelCreator {
  @override
  Library createLibrary(CleanArchEntityItem item) {
    return Library((b) => b
      ..directives.addAll([
        Directive.part('${modelName(item.entityName)}.g.dart'),
        Directive.part('${modelName(item.entityName)}.freezed.dart')
      ])
      ..body.add(createClass(item))
    );
  }
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
        ..initializers.add(Code('super()'))))
      ..constructors.add(Constructor((b) => b
        ..factory = true
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
                refer('JsonKey').call(
                  [],
                  {
                    if (e.jsonKey?.name != null) 'name': literal(e.jsonKey!.name!),
                    if (e.jsonKey?.includeFromJson != null) 'includeFromJson': literal(e.jsonKey!.includeFromJson!),
                    if (e.jsonKey?.includeToJson != null) 'includeToJson': literal(e.jsonKey!.includeToJson!),
                    if (e.jsonKey?.fromJson != null) 'fromJson': refer(e.jsonKey!.fromJson!.toString()),
                    if (e.jsonKey?.toJson != null) 'toJson': refer(e.jsonKey!.toJson!.toString()),
                  },
                ),
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
