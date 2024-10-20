import 'dart:io';
import 'package:yaml/yaml.dart';

class CleanArchYamlConfig {
  final String featuresDirectory;
  final YamlConfigSharedEntity sharedEntity;
  final bool generateFeatures;
  final String baseExportFile;
  final List<String> exclude;

  String get rootDirectory => featuresDirectory;

  CleanArchYamlConfig({
    required this.featuresDirectory,
    required this.sharedEntity,
    required this.generateFeatures,
    required this.baseExportFile,
    required this.exclude,
  });

  factory CleanArchYamlConfig.fromYaml(Map yaml) {
    return CleanArchYamlConfig(
      featuresDirectory: yaml['features_directory'] as String,
      sharedEntity:  YamlConfigSharedEntity.fromYaml(yaml['shared_entity']),
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




class YamlConfigSharedEntity {
  final String? directory;

  YamlConfigSharedEntity({required this.directory,});

  factory YamlConfigSharedEntity.fromYaml(List yaml) {
    // مقادیر را از Map پیدا کرده و به مدل تبدیل می‌کنیم
    final generateMap = yaml.firstWhere((map) => map.containsKey('generate'));
    final directoryMap = yaml.firstWhere((map) => map.containsKey('directory'));

    return YamlConfigSharedEntity(
       directory: directoryMap['directory'] ?? '',
    );
  }
}