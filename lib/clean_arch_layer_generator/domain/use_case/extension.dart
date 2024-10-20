

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertUseCaseCreatorToCode on BaseUseCaseCreator {
  String _toCode(MethodItem item) => createClass(item).convertClassToCode();

  void useCaseToCodeAllAndGenerateFiles() {
    String code = '';
    for (MethodItem item in feature.methodItems) {
      code = _toCode(item);
      CleanArchDomainFileGenerator(feature).createUseCaseFile(code , methodItem: item);

    }
  }
}
