import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/domain/repository/base_repository_creator.dart';

class RepositoryCreator extends BaseRepositoryCreator {
  RepositoryCreator({required super.feature});

  @override
  Class createClass() {
    return Class((b) => b
      ..abstract = true
      ..name = repositoryName(feature.featureName)
      ..extend = refer('RepositoryUtils')
      ..methods.addAll(_methodItems()));
  }

  List<Method> _methodItems() {
    return feature.methodItems.map((e) {
      String response = "${e.responseName}<${e.baseResponseType}>";
      String params = e.paramsName;
      return Method((b) => b
        ..name = e.methodName
        ..returns = refer(eitherResponse(response))
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'params'
          ..type = refer(params))));
    }).toList();
  }
}
