import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';
import 'package:flutter_clean_arch_generator/extension/clean_arch_convert_class_to_code.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';

abstract class BaseUseCaseCreator with CleanArchClassGenUtils  {
  final CleanArchFeature feature;
  const BaseUseCaseCreator({required this.feature});

  String useCaseParams(MethodItem item) => item.paramsName;
  String useCaseResponseName(MethodItem item) => item.responseName;
  String useCaseResponseType(MethodItem item) => item.baseResponseType;


  String get baseUseCaseName => 'UseCase';

  Class createClass(MethodItem item);


  List<Class> createAll();
}
