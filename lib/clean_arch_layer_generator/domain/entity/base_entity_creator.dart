import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseEntityCreator with CleanArchClassGenUtils{

  Class createClass(CleanArchEntityItem item);

  String baseEntityName(CleanArchEntityItem item) => "BaseEntity";

 }

