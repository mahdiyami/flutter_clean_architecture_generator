import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

abstract class BaseLocalDataSourceCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseLocalDataSourceCreator({required this.feature});

  String performName(LocalMethodItem item) {
    if (item.isFuture) {
      return "perform(() async";
    } else {
      return "performSync(()";
    }
  }
  Class createClass();
}