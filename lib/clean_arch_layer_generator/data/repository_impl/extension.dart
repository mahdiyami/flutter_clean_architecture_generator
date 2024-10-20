import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertRepositoryImplCreatorToCode on BaseRepositoryImplCreator {
  String _toCode() => createClass().convertClassToCode();

  void repoImplToCodeAllAndGenerateFiles() {
    CleanArchDataFileGenerator(feature).createRepositoryImplFile(_toCode());
  }
}
