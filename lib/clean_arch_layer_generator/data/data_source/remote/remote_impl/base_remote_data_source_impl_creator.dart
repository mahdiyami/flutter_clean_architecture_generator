import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/mixin/clean_arch_class_gen_utils.dart';

abstract class BaseRemoteDataSourceImplCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRemoteDataSourceImplCreator({required this.feature});

  String httpRequest(MethodItem item) {
    String? method = item.apiServiceSettings?.method.methodName;
    String? endPoint = item.apiServiceSettings?.endPoint;
    String baseResponse = item.responseName;
    String model = modelName(item.baseResponseType);

    String fromJson = item.response == BaseResponseNames.noResponse
        ? "${baseResponse}.fromJson(json as Map<String, dynamic>)"
        : "${baseResponse}.fromJson(json as Map<String, dynamic>, (json) => ${model}.fromJson(json as Map<String, dynamic>))";
    return 'appRequest.${method}("/${endPoint}" , fromJson: (json) => ${fromJson},)';
  }

  Class createClass();
}
