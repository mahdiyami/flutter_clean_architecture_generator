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
         c.methods.addAll(_methodItems());
      },
    );
  }



  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String _response = response(e , isModel: true);
      String params = e.paramsName;
      return Method( (b) {
        b.name = e.methodName;
        b.returns = refer(_response);
        if(!e.isNoParams)
          b.requiredParameters.add(Parameter((b) => b
            ..name = 'params'
            ..type = refer(params)));
      },);
    }).toList();
  }

}
