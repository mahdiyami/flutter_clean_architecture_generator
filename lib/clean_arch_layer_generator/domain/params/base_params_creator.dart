import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/utils/params_item.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseParamsCreator with CleanArchClassGenUtils{

  Class createClass(CleanArchParamsItem item);

  String baseParamsName(CleanArchParamsItem item) => "BaseParams";
  String paramsName(String paramsName) {
    if(paramsName.contains("Entity")) {
      return paramsName.replaceAll('Entity', 'Params');
    }
    return '${paramsName.firstLetterUpperCase}Params';
  }
  String get modelAnnotation => "baseParamsFreezed";
  String paramsFromJsonMethodName(CleanArchParamsItem item) => '_\$${paramsName(item.paramsName)}ImplFromJson';
  String paramsFreezedMixinName(String paramsName) {
    return '_\$${paramsName.firstLetterUpperCase}Params';
  }
  String paramsConstructorFreezedMixinName(String paramsName) {
    return '_${paramsName.firstLetterUpperCase}params';
  }

 }

