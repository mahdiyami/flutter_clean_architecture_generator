import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_impl/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_impl/remote_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class FeatureCreator extends BaseFeatureCreator with CleanArchClassGenUtils {
  FeatureCreator({required super.feature});

  @override
  void createFeature() {
    RepositoryCreator(feature: feature).repoToCodeAllAndGenerateFiles();
    EntityCreator().entityToCodeAllAndGenerateFiles(feature);
    UseCaseCreator(feature: feature).useCaseToCodeAllAndGenerateFiles();

    RemoteDataSourceCreator(feature: feature).remoteDataSourceToCodeAllAndGenerateFiles();
    RemoteDataSourceImplCreator(feature: feature).remoteDataSourceImplToCodeAllAndGenerateFiles();
    RepositoryImplCreator(feature: feature).repoImplToCodeAllAndGenerateFiles();
    ModelCreator(feature: feature).modelToCodeAllAndGenerateFiles();
  }

  void createFeatureDirectory() {}
}
