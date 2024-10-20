
import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/entity/utils/entity_item.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';

abstract class BaseSharedCreator with CleanArchClassGenUtils{
  final List<CleanArchEntityItem> shared;
  const BaseSharedCreator({required this.shared});


  void createShared();

 }