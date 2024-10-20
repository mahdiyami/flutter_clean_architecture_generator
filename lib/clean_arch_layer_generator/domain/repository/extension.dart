import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertRepositoryCreatorToCode on BaseRepositoryCreator {
  String _toCode() => createClass().convertClassToCode();

  void repoToCodeAllAndGenerateFiles() {
    CleanArchDomainFileGenerator(feature).createRepositoryFile(_toCode());
  }
}
