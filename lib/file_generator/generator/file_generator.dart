import 'dart:io';

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';


part 'data_layer_generator.p.dart';
part 'domain_layer_generator.p.dart';

abstract class CleanArchFileGenerator with FileCreatorUtils {
  final CleanArchFeature feature;

  CleanArchFileGenerator(this.feature);

  CleanArchYamlConfig get config => CleanArchYamlConfig.loadCleanArchYamlConfig();

  String get currentFeature => "${config.rootDirectory}/${feature.featureName}";

  Directory get featureDirectory => Directory(currentFeature);

  factory CleanArchFileGenerator.createDomain(CleanArchFeature feature) = _CleanArchDomainFileGenerator;

  factory CleanArchFileGenerator.createData(CleanArchFeature feature) = _CleanArchDataFileGenerator;

//Domain Layer
  Future<void> createEntityFile(String content , {required CleanArchEntityItem item}) async {}


  Future<void> createRepositoryFile(String content) async {}

  Future<void> createUseCaseFile(String content , {required MethodItem methodItem}) async {}

//Data Layer
  Future<void> createRepositoryImplFile(String content) async {}

  Future<void> createModelFile(String content , {required CleanArchEntityItem item}) async {}


  Future<void> createRemoteDataSourceFile(String content) async {

  }
  Future<void> createRemoteDataSourceImplFile(String content) async {}

  Future<void> createLocalDataSourceFile(String content) async {}
}
