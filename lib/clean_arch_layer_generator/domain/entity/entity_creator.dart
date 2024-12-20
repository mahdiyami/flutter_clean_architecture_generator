import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class EntityCreator extends BaseEntityCreator {
  @override
  Class createClass(CleanArchEntityItem item) {
    return Class((b) {
      b.name = item.toString();
      b.abstract = true;
      if(item.extendsEntity != null){
        b.extend = refer(item.extendsEntityName);
        b.implements.add(refer(baseEntityName(item)));

      }else{
        b.extend = refer(baseEntityName(item));
      }
      b.constructors.add(Constructor((b) => b
      ..constant = true));
      b.methods.addAll(_entityParams(item: item));
    });

  }


  List<Method> _entityParams({required CleanArchEntityItem item}) {
    return item.entityParams
        .map((e) => Method((b) => b
          ..name = e.objectNameKey
          ..type = MethodType.getter
          ..returns = refer(e.objectTypeToString)))
        .toList();
  }
}
