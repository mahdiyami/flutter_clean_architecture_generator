import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';

class RepositoryImplCreator extends BaseRepositoryImplCreator {
  RepositoryImplCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..name = repositoryImplName(feature.featureName)
      ..extend = refer(repositoryName(feature.featureName))
      ..constructors.add(Constructor((b) => b..requiredParameters.addAll(_parameters())))
      ..fields.addAll(_fields())
      ..methods.addAll(_methodItems()));
  }

  List<Parameter> _parameters() {
    return [
      if(feature.hasRemoteDataSource)
      Parameter((b) => b
        ..name = remoteDatasourceVariableName(feature)
        ..named = true
        ..toThis = true),
      if(feature.hasLocalDataSource)
      Parameter((b) => b
        ..name = localDatasourceVariableName(feature)
        ..named = true
        ..toThis = true),
    ];
  }

  List<Field> _fields() {
    return [
      if(feature.hasRemoteDataSource)
      Field((b) => b
        ..name = remoteDatasourceVariableName(feature)
        ..modifier = FieldModifier.final$
        ..type = refer(remoteDatasourceName(feature))),
      if(feature.hasLocalDataSource)
      Field((b) => b
        ..name = localDatasourceVariableName(feature)
        ..modifier = FieldModifier.final$
        ..type = refer(localDatasourceName(feature))),
    ];
  }

  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String params = e.paramsName;
      return Method((b) => b
        ..name = e.methodName
        ..returns = refer(eitherResponse(e))
        ..body = Code('''
        return ${performName(e)} {
          return ${dataSourceVariableViaMethodItem(e , feature: feature)}.${e.methodName}(params);
        });
      ''')
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'params'
          ..type = refer(params))));
    }).toList();
  }

}
