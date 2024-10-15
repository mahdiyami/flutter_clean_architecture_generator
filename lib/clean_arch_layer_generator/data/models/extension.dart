import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertModelCreatorToCode on BaseModelCreator {
  String _toCode(CleanArchEntityItem item) => createClass(item).convertClassToCode();

  void modelToCodeAllAndGenerateFiles() {
    String code = '';
    for (CleanArchEntityItem item in feature.entities) {
      code = _toCode(item);
      CleanArchFileGenerator.createData(feature).createModelFile(code , item: item);

    }
  }
}
