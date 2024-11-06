import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertModelCreatorToCode on BaseModelCreator {
  String _toCode(CleanArchEntityItem item) => createClass(item).convertClassToCode(partDirective: partDirective(item));

  void modelToCodeAllAndGenerateFiles(CleanArchFeature feature) {
    String code = '';
    for (CleanArchEntityItem item in feature.entities) {
      code = _toCode(item);
      CleanArchDataFileGenerator(feature).createModelFile(code , item: item);

    }
  }
  void sharedModelToCodeAllAndGenerateFiles(List<CleanArchEntityItem> shared) {
    String code = '';
    for (CleanArchEntityItem item in shared) {
      code = _toCode(item);
      CleanArchSharedFileGenerator().createSharedModelFile(code , item: item);

    }
  }
}
