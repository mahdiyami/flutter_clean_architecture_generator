import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';
import 'package:flutter_clean_arch_generator/method/base_method.dart';

abstract class BaseRemoteDataSourceCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRemoteDataSourceCreator({required this.feature});

  String performName(BaseMethodItem item) {
    if (item.isFuture) {
      return "perform(() async";

    } else {
      return "performSync(()";

    }
  }

  Class createClass();
}
