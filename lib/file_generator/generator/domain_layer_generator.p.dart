part of 'file_generator.dart';


class _CleanArchDomainFileGenerator extends CleanArchFileGenerator {
  _CleanArchDomainFileGenerator(super.feature);

  String get currentFeatureDomain => "${config.rootDirectory}/${feature.featureName}/clean_arch_layer_generator.domain";
  String get _repositoryDirectory => "$currentFeatureDomain/repository";
  String get _entityDirectory => "$currentFeatureDomain/entities";
  String get _useCaseDirectory => "$currentFeatureDomain/use_case";
  @override
  Future<void> createEntityFile(String content , {required CleanArchEntityItem item}) async {
    await createFile('$_entityDirectory/${item.entityName.firstLetterLowerCase}_entity.dart' , content: content);

  }
  @override
  Future<void> createRepositoryFile(String content) async {
    await createFile('$_repositoryDirectory/${feature.featureName.firstLetterLowerCase}_repository.dart' , content: content);
  }

  @override
  Future<void> createUseCaseFile(String content , {required MethodItem methodItem}) async {
    await createFile('$_useCaseDirectory/${methodItem.methodName.firstLetterLowerCase}_use_case.dart' , content: content);

  }


}
