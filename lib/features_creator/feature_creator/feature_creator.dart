import 'package:flutter_clean_arch_generator/domain/repository/extension.dart';
import 'package:flutter_clean_arch_generator/domain/repository/repository_creator.dart';
import 'package:flutter_clean_arch_generator/domain/use_case/extension.dart';
import 'package:flutter_clean_arch_generator/domain/use_case/use_case_creator.dart';
import 'package:flutter_clean_arch_generator/features_creator/feature_creator/base_feature_creator.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';

class FeatureCreator extends BaseFeatureCreator with CleanArchClassGenUtils {
  FeatureCreator({required super.feature});

  @override
  void createFeature() {
    RepositoryCreator(feature: feature).toCodeAllAndGenerateFiles();
    UseCaseCreator(feature: feature).toCodeAllAndGenerateFiles();
  }

  void createFeatureDirectory() {}
}
