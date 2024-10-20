part of 'file_generator.dart';


class CleanArchDomainFileGenerator extends CleanArchFileGenerator {
  final CleanArchFeature feature;
  CleanArchDomainFileGenerator(this.feature);

  String get currentFeatureDomain => "${config.rootDirectory}/${feature.featureName}/domain";
  String get _repositoryDirectory => "$currentFeatureDomain/repository";
  String get _entityDirectory => "$currentFeatureDomain/entities";
  String get _useCaseDirectory => "$currentFeatureDomain/use_case";
  Future<void> createEntityFile(String content , {required CleanArchEntityItem item}) async {
    await createFile('$_entityDirectory/${item.entityName.firstLetterLowerCase}_entity.dart' , content: content);

  }
  Future<void> createRepositoryFile(String content) async {
    await createFile('$_repositoryDirectory/${feature.featureName.firstLetterLowerCase}_repository.dart' , content: content);
  }

  Future<void> createUseCaseFile(String content , {required MethodItem methodItem}) async {
    await createFile('$_useCaseDirectory/${methodItem.methodName.firstLetterLowerCase}_use_case.dart' , content: content);

  }


}
