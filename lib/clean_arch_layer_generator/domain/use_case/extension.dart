import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertUseCaseCreatorToCode on BaseUseCaseCreator {
  String _toCode(BaseMethodItem item) => createClass(item).convertClassToCode();

  void useCaseToCodeAllAndGenerateFiles() {
    String code = '';
    for (BaseMethodItem item in feature.methodItems) {
      code = _toCode(item);
      if (item == LocalMethodItem) {
        _handleLocalMethodItem(item as LocalMethodItem);
      }
      CleanArchDomainFileGenerator(feature).createUseCaseFile(code, methodItem: item);
    }
  }

  _handleLocalMethodItem(LocalMethodItem item) {}
}
