import 'dart:io';

import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/yaml_config/clean_arch_yaml_config.dart';

extension CleanArchFeatureFileAndDirectoryCreator on List<CleanArchFeature> {
  Future<void> createFeaturesDirectory() async {
    CleanArchYamlConfig config = CleanArchYamlConfig.loadCleanArchYamlConfig();
    for (CleanArchFeature feature in this) {
      Directory featureDirectory = Directory('${config.featuresDirectory}/${feature.featureName}');
      if (!featureDirectory.existsSync()) {
        featureDirectory.createSync();
       await _createDataAndDomainDirectories();
      }
    }
  }

  _createDataAndDomainDirectories() async {
    CleanArchYamlConfig config = CleanArchYamlConfig.loadCleanArchYamlConfig();
    Directory dataDirectory = Directory('${config.featuresDirectory}/data');
    Directory domainDirectory = Directory('${config.featuresDirectory}/domain');
    if (!dataDirectory.existsSync()) {
      dataDirectory.createSync();
    }
    if (!domainDirectory.existsSync()) {
      domainDirectory.createSync();
    }
  }

  _createDomainDetailsDirectoryAndFile(CleanArchFeature feature) async {
    CleanArchYamlConfig config = CleanArchYamlConfig.loadCleanArchYamlConfig();
    File domainDetailsFile = File('${config.featuresDirectory}/domain/repository/${feature.featureName}_repository.dart');
    if (!domainDetailsFile.existsSync()) {
      domainDetailsFile.createSync();
    }
  }
}



