import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseRemoteDataSourceImplCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRemoteDataSourceImplCreator({required this.feature});

  String httpRequest(RemoteMethodItem item) {
    String? method = item.settings.method.methodName;
    String? endPoint = _handleEndpoint(item);
    String baseResponse = item.responseNameModel;
    String model = modelName(item.baseResponseTypeModel);
    String queryParameters = item.settings.queryParameters ? ", queryParam: params.toJson()" : "";
    String bodyParameters = item.settings.body ? ", data: params.toJson()" : "";
    String cast = item.responseEntity.fold(
      (l) => "Map<String, dynamic>",
      (r) => r.fold(
        (l) => item.baseResponseTypeModel,
        (r) => "Map<String, dynamic>, (json) => ${model}.fromJson(json as Map<String, dynamic>)",
      ),
    );

    String fromJson = item.response == BaseResponseNames.noResponse || _responseHasFromJson(item.responseEntity)
        ? "${baseResponse}.fromJson(json as $cast)"
        : "${baseResponse}.fromJson(json as $cast, (json) => ${model}.fromJson(json as Map<String, dynamic>))";
    return 'appRequest.${method}("/${endPoint}" , fromJson: (json) => ${fromJson}${queryParameters}${bodyParameters})';
  }

  bool _responseHasFromJson(ResponseEntity responseEntity) {
    return responseEntity.fold(
      (l) {
        return false;
      },
      (r) => true,
    );
  }

  String _handleEndpoint(RemoteMethodItem item) {
     String? endPoint ="${item.settings.endPoint.removeIfExistLastLetterSlash}/";

     String _buildParamsValuesPath(List<ParamsProperty> properties) {
      return properties
          .map((prop) => '\${pathParams.${prop.objectNameKey}}') // تبدیل به ${pathParams.key}
          .join('/');
    }

    if (item.hasPathParams) {
      final cleanArchParams = item.pathParams.fold(
            (cleanArchParamsItem) => cleanArchParamsItem,
            (type) => type,
      );

      if (cleanArchParams is CleanArchParamsItem) {
        endPoint = '$endPoint${_buildParamsValuesPath(cleanArchParams.paramsProperty)}';
      } else {
        endPoint = '$endPoint\${pathParams.${cleanArchParams.toString()}}';
      }
    }

    return endPoint.removeIfExistFirstLetterSlash;
  }







  Class createClass();
}
