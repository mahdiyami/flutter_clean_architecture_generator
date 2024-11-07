import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ParamsParamsCreatorToCode on BaseParamsCreator {
  String _toCode(CleanArchParamsItem item) => createClass(item).convertClassToCode(partDirective: partDirective(item));

  void paramsToCodeAllAndGenerateFiles(CleanArchFeature feature) {
    String code = '';
    for (CleanArchParamsItem item in feature.params) {
      code = _toCode(item);
      CleanArchDomainFileGenerator(feature).createParamsFile(code, item: item);
    }
  }

  void sharedParamsToCodeAllAndGenerateFiles(List<CleanArchParamsItem> shared) {
    String code = '';
    for (CleanArchParamsItem item in shared) {
      code = _toCode(item);
      CleanArchSharedFileGenerator().createSharedParamsFile(code, item: item);
    }
  }
}
