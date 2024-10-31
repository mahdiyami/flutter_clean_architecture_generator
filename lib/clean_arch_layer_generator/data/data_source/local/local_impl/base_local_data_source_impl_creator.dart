import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';
enum LocalDataMethodType { get, save, remove }
abstract class BaseLocalDataSourceImplCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseLocalDataSourceImplCreator({required this.feature});

  String cacheKey(LocalMethodItem item) {
    return "${item.methodName}CacheKey";
  }
  String methodName(LocalDataMethodType type, LocalMethodItem item) {
    return "${type.name}${item.methodName.firstLetterUpperCase}";
  }

  Class createClass( );
}
