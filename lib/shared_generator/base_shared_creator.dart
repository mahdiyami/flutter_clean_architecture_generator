
import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/entity/utils/entity_item.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/utils/params_item.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';

abstract class BaseSharedCreator with CleanArchClassGenUtils{
  final List<CleanArchEntityItem> sharedEntities;
  final List<CleanArchParamsItem> sharedParams;
  const BaseSharedCreator({required this.sharedEntities , required this.sharedParams});


  void createShared();

 }