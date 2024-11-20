import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';

class RepositoryImplCreator extends BaseRepositoryImplCreator {
  RepositoryImplCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..annotations.add(refer('LazySingleton').call([
        CodeExpression(Code('as: ${repositoryName(feature.featureName)}'))
      ]))
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
      String paramsArgsName = e.hasParams1 ?  "":'params';

       return Method((b) {
         b.name = e.methodName;
         b.annotations.add(refer('override'));
         b.returns = refer(eitherResponse(e));
         b.body = Code('''
        return ${performName(e)} {
          return ${dataSourceVariableViaBaseMethodItem(e , feature: feature)}.${e.methodName}($paramsArgsName);
        });
      ''');
         if(!e.hasParams1)
         b.requiredParameters.add(Parameter((b) => b
         ..name = 'params'
         ..type = refer(e.params1Name)));
       },);
    }).toList();
  }

}
