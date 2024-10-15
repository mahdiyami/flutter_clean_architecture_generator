
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class FeatureCreator extends BaseFeatureCreator with CleanArchClassGenUtils {
  FeatureCreator({required super.feature});

  @override
  void createFeature() {
    RepositoryCreator(feature: feature).repoToCodeAllAndGenerateFiles();
    UseCaseCreator(feature: feature).useCaseToCodeAllAndGenerateFiles();
  }

  void createFeatureDirectory() {}
}
