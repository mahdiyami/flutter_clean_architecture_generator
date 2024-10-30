import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';

import 'base_local_data_source_creator.dart';

class LocalDataSourceCreator extends BaseLocalDataSourceCreator {
  LocalDataSourceCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..abstract = true
      ..name = remoteDatasourceName(feature)
       ..methods.addAll(_methodItems()));
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
}
