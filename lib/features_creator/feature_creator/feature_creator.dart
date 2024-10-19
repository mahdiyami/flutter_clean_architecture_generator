
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/entity/extension.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class FeatureCreator extends BaseFeatureCreator with CleanArchClassGenUtils {
  FeatureCreator({required super.feature});

  @override
  void createFeature() {
    RepositoryCreator(feature: feature).repoToCodeAllAndGenerateFiles();
    EntityCreator(feature: feature).entityToCodeAllAndGenerateFiles();
    UseCaseCreator(feature: feature).useCaseToCodeAllAndGenerateFiles();

    RepositoryImplCreator(feature: feature).repoImplToCodeAllAndGenerateFiles();
    ModelCreator(feature: feature).modelToCodeAllAndGenerateFiles();

  }

  void createFeatureDirectory() {}
}
