import 'package:flutter_clean_arch_generator/extension/string.dart';

mixin class CleanArchClassGenUtils {
  String eitherResponse(String responseName) {
    return 'FutureOr<Either<Failure, $responseName>>';
  }

  String repositoryName(String featureName) {
    return '${featureName.firstLetterUpperCase}Repository';
  }

  String useCaseName(String methodName) {
    return '${methodName.firstLetterUpperCase}UseCase';
  }
}
