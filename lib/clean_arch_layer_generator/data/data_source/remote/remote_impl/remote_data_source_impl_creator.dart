import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_impl/base_remote_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/method/base_method.dart';

class RemoteDataSourceImplCreator extends BaseRemoteDataSourceImplCreator {
  RemoteDataSourceImplCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..annotations.add(refer('LazySingleton').call([
        CodeExpression(Code('as: ${remoteDatasourceName(feature)}'))
      ]))
      ..name = remoteDatasourceImplName(feature)
      ..extend = refer(remoteDatasourceName(feature))
       ..methods.addAll(_methodItems()));
  }

  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String params = e.paramsName;
      return Method((b) {
        b.annotations.add(refer('override'));
           b.name = e.methodName;
          b.returns = refer(response(e , isModel: true));
          b.lambda = true;
          b.body = Code(httpRequest(e.toRemoteMethodItem));
          if(!e.isNoParams)
          b.requiredParameters.add(Parameter((b) => b
            ..name = 'params'
            ..type = refer(params)));
      },);
    }).toList();
  }
}
