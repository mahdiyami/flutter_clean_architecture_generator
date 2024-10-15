import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';


class EntityCreator extends BaseEntityCreator {
  EntityCreator({required super.items});

  @override
  Class create({required EntityItem item}) {
    return Class((b) => b
      ..name = item.toString()
      ..abstract = true
      ..extend = refer('BaseEntity')
      ..methods.add(Method((b) => b
        ..name = 'registered'
        ..type = MethodType.getter
        ..returns = refer('bool')))
      ..methods.addAll(_entityParams(item: item)));
  }

  List<Method> _entityParams({required EntityItem item}) {
    return item.entityParams
        .map((e) => Method((b) => b
          ..name = e.objectNameKey
          ..type = MethodType.getter
          ..returns = refer(e.objectType.toString())))
        .toList();
  }

  @override
  List<Class> createAll() {
    return items.map((e) => create(item: e)).toList();
  }
}
