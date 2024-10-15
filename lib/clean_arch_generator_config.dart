

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class CleanArchGeneratorConfig {


  List<EntityItem> get entities;

  List<CleanArchFeature> get features;
}

abstract class CleanArchFeature {
  String get featureName;

  List<MethodItem> get methodItems;
}
