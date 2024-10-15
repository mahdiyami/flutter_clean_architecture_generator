
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertRepositoryCreatorToCode on BaseRepositoryCreator {
  String _toCode() => createClass().convertClassToCode();

  void repoToCodeAllAndGenerateFiles() {
    CleanArchFileGenerator.createDomain(feature).createRepositoryFile(_toCode());
  }
}
