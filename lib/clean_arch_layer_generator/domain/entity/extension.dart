import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertEntityCreatorToCode on BaseEntityCreator {
  String _toCode(CleanArchEntityItem item) => createClass(item).convertClassToCode();

  void entityToCodeAllAndGenerateFiles() {
    String code = '';
    for (CleanArchEntityItem item in feature.entities) {
      code = _toCode(item);
      CleanArchFileGenerator.createDomain(feature).createEntityFile(code , item: item);

    }
  }
}
