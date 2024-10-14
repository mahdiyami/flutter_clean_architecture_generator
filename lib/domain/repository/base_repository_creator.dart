import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/domain/repository/utils/repository_item.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_convert_class_to_code.dart';

abstract class BaseRepositoryCreator with CleanArchClassGenUtils , CleanArchConvertClassToCode {
  final CleanArchFeature feature;
  const BaseRepositoryCreator({required this.feature});


  Class createClass();

}
