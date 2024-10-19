import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class CleanArchGeneratorConfig {
  List<CleanArchEntityItem> get sharedEntities;

  List<CleanArchFeature> get features;
}

abstract class CleanArchFeature {
  String get featureName;

  List<CleanArchEntityItem> get entities;

  List<MethodItem> get methodItems;

  bool get hasLocalDataSource {
    return methodItems.any((element) => element.isLocalData || element.isCachedResponse);
  }

  bool get hasRemoteDataSource {
    return !methodItems.every((element) => element.isLocalData);
  }
}
