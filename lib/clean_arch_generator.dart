

import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/features_creator/features_creator.dart';
import 'package:flutter_clean_arch_generator/shared_generator/shared_creator.dart';

class CleanArchGenerator {
  final CleanArchGeneratorConfig config;
  const CleanArchGenerator(this.config);


  void generate(){
    SharedCreator(shared: config.sharedEntities).createShared();
    FeaturesCreator(features: config.features).createFeatures();
  }
}