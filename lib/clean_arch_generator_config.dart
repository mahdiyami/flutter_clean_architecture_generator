import 'package:flutter_clean_arch_generator/utils/method_item.dart';

import 'domain/entity/utils/entity_item.dart';

abstract class CleanArchGeneratorConfig {


  List<EntityItem> get entities;

  List<CleanArchFeature> get features;
}

abstract class CleanArchFeature {
  String get featureName;

  List<MethodItem> get methodItems;
}
