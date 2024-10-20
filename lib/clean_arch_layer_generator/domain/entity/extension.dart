import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertEntityCreatorToCode on BaseEntityCreator {
  String _toCode(CleanArchEntityItem item) => createClass(item).convertClassToCode();

  void entityToCodeAllAndGenerateFiles(CleanArchFeature feature) {
    String code = '';
    for (CleanArchEntityItem item in feature.entities) {
      code = _toCode(item);
      CleanArchDomainFileGenerator(feature).createEntityFile(code, item: item);
    }
  }

  void sharedEntityToCodeAllAndGenerateFiles(List<CleanArchEntityItem> shared) {
    String code = '';
    for (CleanArchEntityItem item in shared) {
      code = _toCode(item);
      CleanArchSharedEntityFileGenerator().createSharedEntityFile(code, item: item);
    }
  }
}
