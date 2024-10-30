import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_impl/base_remote_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class RemoteDataSourceImplCreator extends BaseRemoteDataSourceImplCreator {
  RemoteDataSourceImplCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..annotations.add(refer('LazySingleton').call([
        CodeExpression(Code('as: ${remoteDatasourceName(feature)}'))
      ]))
      ..name = repositoryImplName(feature.featureName)
      ..extend = refer(remoteDatasourceName(feature))
       ..methods.addAll(_methodItems()));
  }

  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String params = e.paramsName;
      return Method((b) => b
        ..name = e.methodName
        ..returns = refer(eitherResponse(e))
        ..lambda = true
        ..body = Code(httpRequest(e as MethodItem<RemoteDataSettings>))
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'params'
          ..type = refer(params))));
    }).toList();
  }
}
