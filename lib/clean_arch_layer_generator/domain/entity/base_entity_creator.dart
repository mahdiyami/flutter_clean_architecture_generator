import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseEntityCreator with CleanArchClassGenUtils{
  final CleanArchFeature feature;
  const BaseEntityCreator({required this.feature});

  Class createClass(CleanArchEntityItem item);

  String get baseEntityName => 'BaseEntity';

 }

