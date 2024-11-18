import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/method/base_method.dart';

abstract class BaseLocalDataSourceCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseLocalDataSourceCreator({required this.feature});

  String methodName(LocalDataMethodType type, LocalMethodItem item) {
    return "${type.name}${item.methodName.firstLetterUpperCase}";
  }
  Class createClass();
}
