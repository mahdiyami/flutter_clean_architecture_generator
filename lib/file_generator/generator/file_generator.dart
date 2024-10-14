import 'dart:io';

import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/file_generator/mixin/file_creator_utils.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';
import 'package:flutter_clean_arch_generator/yaml_config/clean_arch_yaml_config.dart';

part 'data_layer_generator.dart';
part 'domain_layer_generator.dart';

abstract class CleanArchFileGenerator with FileCreatorUtils {
  final CleanArchFeature feature;

  CleanArchFileGenerator(this.feature);

  CleanArchYamlConfig get config => CleanArchYamlConfig.loadCleanArchYamlConfig();

  String get currentFeature => "${config.rootDirectory}/${feature.featureName}";

  Directory get featureDirectory => Directory(currentFeature);

  factory CleanArchFileGenerator.createDomain(CleanArchFeature feature) = _CleanArchDomainFileGenerator;

  factory CleanArchFileGenerator.createData(CleanArchFeature feature) = _CleanArchDataFileGenerator;

//Domain Layer
  Future<void> createRepositoryFile(String content) async {}

  Future<void> createUseCaseFile(String content , {required MethodItem methodItem}) async {}

//Data Layer
  Future<void> createRepositoryImplFile(String content) async {}

  Future<void> createRemoteDataSourceFile(String content) async {}

  Future<void> createLocalDataSourceFile(String content) async {}
}
