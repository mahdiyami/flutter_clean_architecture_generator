import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseModelCreator with CleanArchClassGenUtils{
  final CleanArchFeature feature;
  const BaseModelCreator({required this.feature});

  Class createClass(CleanArchEntityItem item);

  String get baseEntityName => 'BaseEntity';
  String get baseModelName => 'BaseModel';
  String get modelAnnotation => "baseModelFreezed";
  
  String modelFromJsonMethodName(CleanArchEntityItem item) => '_\$${modelName(item.entityName)}ImplFromJson';

 }

