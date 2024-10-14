import 'package:flutter_clean_arch_generator/domain/use_case/base_use_case_creator.dart';
import 'package:flutter_clean_arch_generator/file_generator/generator/file_generator.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';

extension ConvertUseCaseCreatorToCode on BaseUseCaseCreator {
  String _toCode(MethodItem item) => convertClassToCode(createClass(item));

  void toCodeAllAndGenerateFiles() {
    String code = '';
    for (MethodItem item in feature.methodItems) {
      code = _toCode(item);
      CleanArchFileGenerator.createDomain(feature).createUseCaseFile(code , methodItem: item);

    }
  }
}
