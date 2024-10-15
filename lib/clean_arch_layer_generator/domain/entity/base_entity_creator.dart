import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseEntityCreator {
  final List<EntityItem> items;
  const BaseEntityCreator({required this.items});

  Class create({required EntityItem item});

  List<Class> createAll();
}

