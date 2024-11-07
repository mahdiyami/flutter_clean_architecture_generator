import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

abstract class BaseUseCaseCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseUseCaseCreator({required this.feature});

  String useCaseParams(BaseMethodItem item) => item.paramsName;
   String useCaseResponseType(BaseMethodItem item) => item.baseResponseType;

  String get baseUseCaseName => 'UseCase';

  Class createClass(BaseMethodItem item);
}
