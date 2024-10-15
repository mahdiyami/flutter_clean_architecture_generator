import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_clean_arch_generator/yaml_config/clean_arch_yaml_config.dart';

extension CleanArchConvertClassToCode on Class {
  String convertClassToCode() {
    CleanArchYamlConfig config = CleanArchYamlConfig.loadCleanArchYamlConfig();
    final library = Library((b) {
      b.directives.addAll([
        Directive.import(config.baseExportFile),
       ]);
      b.body.addAll([
          this,
        ]);});
    final emitter = DartEmitter.scoped();
    return DartFormatter(
      pageWidth: 150,
    ).format('${library.accept(emitter)}');
  }
}
