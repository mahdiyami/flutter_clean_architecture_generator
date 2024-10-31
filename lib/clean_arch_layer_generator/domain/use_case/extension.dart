

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

extension ConvertUseCaseCreatorToCode on BaseUseCaseCreator {
  String _toCode(BaseMethodItem item) => createClass(item).convertClassToCode();

  void useCaseToCodeAllAndGenerateFiles() {
    String code = '';
    for (BaseMethodItem item in feature.methodItems) {
      code = _toCode(item);
      CleanArchDomainFileGenerator(feature).createUseCaseFile(code , methodItem: item);

    }
  }
}
