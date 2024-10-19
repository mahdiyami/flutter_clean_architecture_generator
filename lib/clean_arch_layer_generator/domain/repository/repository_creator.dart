import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

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
      String params = e.paramsName;
      return Method((b) => b
        ..name = e.methodName
        ..returns = refer(eitherResponse(e))
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'params'
          ..type = refer(params))));
    }).toList();
  }
}
