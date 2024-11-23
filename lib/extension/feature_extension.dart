import 'dart:ffi';

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension FeatureExtension on CleanArchFeature {
  CleanArchFeature get localDataMethodHandler {
    final updatedMethodItems = methodItems.expand((item) {
      if (item is LocalMethodItem) {

        return [
          item.copyWith(methodName: _methodName(LocalDataMethodType.save, item) , responseEntity: Right(Left(Void))),
          item.copyWith(methodName: _methodName(LocalDataMethodType.get, item) , params: Right(Null) , isFuture: false),
          item.copyWith(methodName: _methodName(LocalDataMethodType.remove, item ), responseEntity: Right(Left(Void)) , params: Right(Null)),
        ];
      }
      return [item];
    }).toList();

    return copyWith(methodItems: updatedMethodItems);
  }
  String _methodName(LocalDataMethodType type, LocalMethodItem item) {
    return "${type.name}${item.methodName.firstLetterUpperCase}";
  }
}
