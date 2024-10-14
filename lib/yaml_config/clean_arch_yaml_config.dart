import 'dart:io';
import 'package:yaml/yaml.dart';

class CleanArchYamlConfig {
  final String featuresDirectory;
  final List<YamlConfigEntity> entities;
  final bool generateFeatures;
  final String baseExportFile;
  final List<String> exclude;

  String get rootDirectory => featuresDirectory;

  CleanArchYamlConfig({
    required this.featuresDirectory,
    required this.entities,
    required this.generateFeatures,
    required this.baseExportFile,
    required this.exclude,
  });

  factory CleanArchYamlConfig.fromYaml(Map yaml) {
    return CleanArchYamlConfig(
      featuresDirectory: yaml['features_directory'] as String,
      entities: List<YamlConfigEntity>.from(yaml['entities']
          .map((entity) => YamlConfigEntity.fromYaml(entity))),
      generateFeatures: yaml['features'][0]['generate'] as bool,
      baseExportFile: yaml['base_export_file'] as String,
      exclude: List<String>.from(yaml['exclude']),
    );
  }


 static CleanArchYamlConfig loadCleanArchYamlConfig() {
    final file = File('clean_arch_generator.yaml');

    final yamlString =  file.readAsStringSync();

    final yamlMap = loadYaml(yamlString) as YamlMap;

    return CleanArchYamlConfig.fromYaml(yamlMap['clean_arch_generator']);
  }
}




class YamlConfigEntity {
  final String? directory;
  final String? path;

  YamlConfigEntity({required this.directory, required this.path});

  factory YamlConfigEntity.fromYaml(Map yaml) {
    return YamlConfigEntity(
      directory: yaml['directory'] as String?,
      path: yaml['path'] as String?,
    );
  }
}