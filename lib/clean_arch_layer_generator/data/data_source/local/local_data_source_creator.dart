import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/base_local_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

import 'base_local_data_source_creator.dart';

class LocalDataSourceCreator extends BaseLocalDataSourceCreator {
  LocalDataSourceCreator({required super.feature});

  @override
  Class createClass() {
    List<LocalMethodItem> items = feature.methodItems.toLocalMethodItems;

    return Class(
      (c) {
         c.abstract = true;
        c.name = localDatasourceName(feature);
        c.extend = refer(baseLocalDatasourceName(feature));
         items.forEach((item) {
           c.methods.addAll(_methods(item));
         });
      },
    );
  }

  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String _response = response(e , isModel: true);
      String params = e.paramsName;
      return Method((b) => b
        ..name = e.methodName
        ..returns = refer(_response)
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'params'
          ..type = refer(params))));
    }).toList();
  }

  List<Method> _methods(LocalMethodItem item) {
    return [
      // Add method: setToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.save, item);
        m.returns = refer(futureOrBasicResponse("void"));
        m.requiredParameters.add(Parameter((p) => p
          ..name = 'params'
          ..type = refer(item.paramsName.toString())));

       }), // Add method: getToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.get, item);
        m.returns = refer(futureOrBasicResponse(item.paramsName));

      }), // Add method: removeToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.remove, item);
        m.returns = refer(futureOrBasicResponse("void"));

       })
    ];
  }

}
