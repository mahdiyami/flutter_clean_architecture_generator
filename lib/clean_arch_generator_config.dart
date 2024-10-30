import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/utils/params_item.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class CleanArchGeneratorConfig {
  List<CleanArchEntityItem> get sharedEntities;

  List<CleanArchParamsItem> get sharedParams;

  List<CleanArchFeature> get features;
}

abstract class CleanArchFeature {
  String get featureName;

  List<CleanArchEntityItem> get entities;

  List<CleanArchParamsItem> get params;

  List<MethodItem> get methodItems;

  bool get hasLocalDataSource {
    return methodItems.any((element) => element.serviceSettings is LocalDataServiceSettings || element.isCachedResponse);
  }

  bool get hasRemoteDataSource {
    return !methodItems.every((element) => element.serviceSettings is LocalDataServiceSettings);
  }

  CleanArchFeature copyWith({
    String? featureName,
    List<CleanArchEntityItem>? entities,
    List<CleanArchParamsItem>? params,
    List<MethodItem>? methodItems
  });
}
