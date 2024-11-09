import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';

class RemoteDataSourceCreator extends BaseRemoteDataSourceCreator {
  RemoteDataSourceCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..abstract = true
      ..name = remoteDatasourceName(feature)
      ..extend = refer(baseRemoteDatasourceName(feature))
       ..methods.addAll(_methodItems()));
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
