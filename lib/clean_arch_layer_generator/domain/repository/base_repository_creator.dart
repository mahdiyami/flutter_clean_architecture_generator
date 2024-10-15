import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';

abstract class BaseRepositoryCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRepositoryCreator({required this.feature});


  Class createClass();

}
