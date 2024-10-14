import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

mixin CleanArchConvertClassToCode {
  String convertClassToCode(Class classModel) {
    final library = Library((b) {
      b.directives.addAll([
        Directive.import('package:flutter/material.dart'),
       ]);
      b.body.addAll([
          classModel,
        ]);});
    final emitter = DartEmitter.scoped();
    return DartFormatter(
      pageWidth: 150,
    ).format('${library.accept(emitter)}');
  }
}
