import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class EntityCreator extends BaseEntityCreator {
  EntityCreator({required super.feature});

  @override
  Class createClass(CleanArchEntityItem item) {
    return Class((b) => b
      ..name = item.toString()
      ..abstract = true
      ..extend = refer(baseEntityName)
      ..methods.addAll(_entityParams(item: item)));;
  }



  List<Method> _entityParams({required CleanArchEntityItem item}) {
    return item.entityParams
        .map((e) => Method((b) => b
          ..name = e.objectNameKey
          ..type = MethodType.getter
          ..returns = refer(
              e.nullable ? '${e.objectType}?' : e.objectType.toString())))
        .toList();
  }

}
