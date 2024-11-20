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
    String cast =  item.responseEntity.fold((l) =>  "Map<String, dynamic>" ,(r) => r.fold((l) => item.baseResponseTypeModel, (r) => "Map<String, dynamic>, (json) => ${model}.fromJson(json as Map<String, dynamic>)" ,),);


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
  String _handleEndpoint(BaseMethodItem item) {
    // مقدار اولیه endpoint
    String? endPoint = item.methodName;

    // بررسی params
    final bool isParamsPathParams = item.params1.fold(
          (cleanArchParamsItem) => cleanArchParamsItem.isPathParams,
          (_) => false,
    );

    // بررسی params2
    final bool isPathParamsPathParams = item.pathParams .fold(
          (cleanArchParamsItem) => cleanArchParamsItem.isPathParams,
          (_) => false,
    );

    // قانون: فقط یکی می‌تواند true باشد
    if (isParamsPathParams && isPathParamsPathParams) {
      throw Exception(
          'Only one of params or params2 can have isPathParams set to true.');
    }

    // تابع کمکی برای استخراج اطلاعات paramsProperty
    String _buildParamsPropertiesString(List<ParamsProperty> properties) {
      return properties
          .map((prop) =>
      '${prop.objectNameKey}={${prop.objectTypeToString.toString()}}') // تنظیم مقادیر پارامترها
          .join('&'); // با & جدا می‌کنیم
    }

    // هندل کردن params
    if (isParamsPathParams) {
      final cleanArchParams = item.params1.fold(
            (cleanArchParamsItem) => cleanArchParamsItem,
            (type) => type,
      );

      if (cleanArchParams is CleanArchParamsItem) {
        endPoint = '$endPoint?${_buildParamsPropertiesString(cleanArchParams.paramsProperty)}';
      } else {
        endPoint = '$endPoint?value=${cleanArchParams.toString()}';
      }
    }

    // هندل کردن params2
    if (isPathParamsPathParams) {
      final cleanArchParams = item.pathParams.fold(
            (cleanArchParamsItem) => cleanArchParamsItem,
            (type) => type,
      );

      if (cleanArchParams is CleanArchParamsItem) {
        endPoint = '$endPoint?${_buildParamsPropertiesString(cleanArchParams.paramsProperty)}';
      } else {
        endPoint = '$endPoint?value=${cleanArchParams.toString()}';
      }
    }

    // حذف / اضافی از ابتدای endpoint
    return endPoint.removeIfExistFirstLetterSlash ?? endPoint!;
  }


  Class createClass();
}
