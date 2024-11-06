import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/extension.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/local_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

class FeatureCreator extends BaseFeatureCreator with CleanArchClassGenUtils {
  FeatureCreator({required super.feature});

  @override
  void createFeature() {
    RepositoryCreator(feature: feature).repoToCodeAllAndGenerateFiles();
    EntityCreator().entityToCodeAllAndGenerateFiles(feature);
    UseCaseCreator(feature: feature).useCaseToCodeAllAndGenerateFiles();
    ParamsCreator().paramsToCodeAllAndGenerateFiles(feature);

    _remoteDataSources(feature);
    _localDataSources(feature);
    RepositoryImplCreator(feature: feature).repoImplToCodeAllAndGenerateFiles();
    ModelCreator().modelToCodeAllAndGenerateFiles(feature);
  }

  void _localDataSources(CleanArchFeature feature) {
    final CleanArchFeature filteredFeature = feature.copyWith(
        methodItems: feature.methodItems.where((element) => element is LocalMethodItem).toList());
    LocalDataSourceCreator(feature: filteredFeature).localDataSourceToCodeAllAndGenerateFiles();
    LocalDataSourceImplCreator(feature: filteredFeature).localDataSourceImplToCodeAllAndGenerateFiles();
  }

  void _remoteDataSources(CleanArchFeature feature) {
    final CleanArchFeature filteredFeature = feature.copyWith(
        methodItems:
            feature.methodItems.where((element) => element is RemoteMethodItem).toList());
    RemoteDataSourceCreator(feature: filteredFeature).remoteDataSourceToCodeAllAndGenerateFiles();
    RemoteDataSourceImplCreator(feature: filteredFeature).remoteDataSourceImplToCodeAllAndGenerateFiles();
  }

  void createFeatureDirectory() {}
}
