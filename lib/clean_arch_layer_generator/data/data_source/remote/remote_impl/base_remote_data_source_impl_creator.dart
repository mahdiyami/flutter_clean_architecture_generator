import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

abstract class BaseRemoteDataSourceImplCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRemoteDataSourceImplCreator({required this.feature});

  String httpRequest(RemoteMethodItem item) {
    String? method = item.settings.method.methodName;
    String? endPoint = item.settings.endPoint;
    String baseResponse = item.responseName;
    String model = modelName(item.baseResponseType);
    String queryParameters = item.settings.queryParameters ? ", queryParam: params.toJson()" : "";
    String bodyParameters = item.settings.body ? ", data: params.toJson()" : "";

    String fromJson = item.response == BaseResponseNames.noResponse
        ? "${baseResponse}.fromJson(json as Map<String, dynamic>)"
        : "${baseResponse}.fromJson(json as Map<String, dynamic>, (json) => ${model}.fromJson(json as Map<String, dynamic>)";
    return 'appRequest.${method}("/${endPoint}" , fromJson: (json) => ${fromJson})${queryParameters}${bodyParameters})';
  }


  Class createClass();
}
