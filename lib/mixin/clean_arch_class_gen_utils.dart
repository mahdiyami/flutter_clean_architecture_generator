

import 'dart:io';

import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/yaml_config/clean_arch_yaml_config.dart';

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


