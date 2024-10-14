import 'package:flutter_clean_arch_generator/domain/repository/base_repository_creator.dart';
import 'package:flutter_clean_arch_generator/file_generator/generator/file_generator.dart';

extension ConvertRepositoryCreatorToCode on BaseRepositoryCreator {
  String _toCode() => convertClassToCode(createClass());

  void toCodeAllAndGenerateFiles() {
    CleanArchFileGenerator.createDomain(feature).createRepositoryFile(_toCode());
  }
}
