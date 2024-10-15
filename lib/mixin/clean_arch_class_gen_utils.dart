import 'package:flutter_clean_arch_generator/extension/string.dart';

mixin class CleanArchClassGenUtils {
  String eitherResponse(String responseName) {
    return 'FutureOr<Either<Failure, $responseName>>';
  }

  String repositoryName(String featureName) {
    return '${featureName.firstLetterUpperCase}Repository';
  }

  String entityName(String entityName) {
    return '${entityName.firstLetterUpperCase}Entity';
  }

  String modelName(String entityName) {
    return '${entityName.firstLetterUpperCase}Model';
  }
  String modelFreezedMixinName(String entityName) {
    return '_\$${entityName.firstLetterUpperCase}Model';
  }
  String modelConstructorFreezedMixinName(String entityName) {
    return '_${entityName.firstLetterUpperCase}Model';
  }

  String useCaseName(String methodName) {
    return '${methodName.firstLetterUpperCase}UseCase';
  }
}
