part of 'file_generator.dart';


class _CleanArchDomainFileGenerator extends CleanArchFileGenerator {
  _CleanArchDomainFileGenerator(super.feature);

  String get currentFeatureDomain => "${config.rootDirectory}/${feature.featureName}/domain";
  String get _repositoryDirectory => "$currentFeatureDomain/repository";
  String get _useCaseDirectory => "$currentFeatureDomain/use_case";

  @override
  Future<void> createRepositoryFile(String content) async {
    await createFile('$_repositoryDirectory/${feature.featureName}_repository.dart' , content: content);
  }

  @override
  Future<void> createUseCaseFile(String content , {required MethodItem methodItem}) async {
    await createFile('$_useCaseDirectory/${methodItem.methodName}_use_case.dart' , content: content);

  }


}
