import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class UseCaseCreator extends BaseUseCaseCreator {
  UseCaseCreator({required super.feature});

  @override
  Class createClass(BaseMethodItem item) {
    return Class(
      (b) {
        String name = useCaseName(item.methodName);
        String repoName = repositoryName(feature.featureName);
        String params1 = item.params1Name;
        String pathParams = item.pathParamsName;
        String params1ArgsName = item.hasParams1 ? "": "params1";
        String params2ArgsName = item.hasPathParams ? "": ",pathParams";
        String response = item.responseName;
        String methodName = item.methodName;
        b
          ..annotations.add(refer('LazySingleton').call([]))
          ..name = name
          // example extends: 'UseCase<LoginResponse, LoginParams>'
          ..extend = refer('$baseUseCaseName<$response, $params1 , $pathParams>')
          ..fields.add(Field((b) => b
            ..modifier = FieldModifier.final$
            ..name = '_repository'
            ..type = refer(repoName)))
          ..constructors.add(Constructor((b) => b
            ..constant = true
            ..requiredParameters.add(Parameter((b) => b
              ..toThis = true
              ..name = '_repository'))))
          ..methods.add(Method((b) => b
            ..annotations.add(refer('override'))
            ..name = 'call'
            ..returns = refer(eitherResponse(item))
            ..requiredParameters.addAll(
              [
                Parameter((b) {
                  b.name = 'params1';
                  b.type = refer(params1);
                }),
                Parameter((b) {
                  b.name = 'pathParams';
                  b.type = refer(pathParams);
                })
              ]
            )
            ..lambda = true
            ..body = Code('_repository.$methodName($params1ArgsName $params2ArgsName)')));
      },
    );
  }

}
