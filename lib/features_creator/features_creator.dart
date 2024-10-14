import 'package:flutter_clean_arch_generator/features_creator/base_features_creator.dart';
import 'package:flutter_clean_arch_generator/features_creator/feature_creator/feature_creator.dart';

class FeaturesCreator extends BaseFeaturesCreator {
  FeaturesCreator({required super.features});

  @override
  void createFeatures() async {
     for (var feature in features) {
      FeatureCreator(feature: feature).createFeature();
    }
  }
}
