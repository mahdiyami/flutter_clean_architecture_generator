part of "file_generator.dart";

class _CleanArchDataFileGenerator extends CleanArchFileGenerator {
  _CleanArchDataFileGenerator(super.feature);

  String get currentFeatureData => "${config.rootDirectory}/${feature.featureName}/data";
  String get _repositoryImplDirectory => "$currentFeatureData/repository_impl";
  String get _modelDirectory => "$currentFeatureData/models";
  String get _datasourceDirectory => "$currentFeatureData/data_source";
  String get _remoteDataSourceDirectory => "$_datasourceDirectory/remote";
  String get _localDataSourceDirectory => "$_datasourceDirectory/local";

  @override
  Future<void> createRepositoryImplFile(String content) async {
    createFile('$_repositoryImplDirectory/${feature.featureName}_repository_impl.dart', content: content);
  }
  @override
  Future<void> createModelFile(String content , {required CleanArchEntityItem item}) async {
    await createFile('$_modelDirectory/${item.entityName.firstLetterLowerCase}_model.dart' , content: content);

  }
  @override
  Future<void> createRemoteDataSourceFile(String content) async {
    createFile('$_remoteDataSourceDirectory/${feature.featureName}_data_source.dart', content: content);
    createFile('$_remoteDataSourceDirectory/${feature.featureName}_data_source_impl.dart', content: content);
  }

  @override
  Future<void> createLocalDataSourceFile(String content) async {
    createFile('$_localDataSourceDirectory/${feature.featureName}_local_data_source.dart', content: content);
    createFile('$_localDataSourceDirectory/${feature.featureName}_local_data_source_impl.dart', content: content);
  }
}
