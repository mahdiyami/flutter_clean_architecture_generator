import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

abstract class BaseRemoteDataSourceImplCreator with CleanArchClassGenUtils {
  final CleanArchFeature feature;
  const BaseRemoteDataSourceImplCreator({required this.feature});

  String httpRequest(RemoteMethodItem item) {
    String? method = item.settings.method.methodName;
    String? endPoint = item.settings.endPoint.removeIfExistFirstLetterSlash;
    String baseResponse = item.responseNameModel;
    String model = modelName(item.baseResponseTypeModel);
    String queryParameters = item.settings.queryParameters ? ", queryParam: params.toJson()" : "";
    String bodyParameters = item.settings.body ? ", data: params.toJson()" : "";
    String cast =  item.responseEntity.fold((l) =>  "Map<String, dynamic>" ,(r) => item.baseResponseTypeModel,);


    String fromJson = item.response == BaseResponseNames.noResponse || _responseHaseFromJson(item.responseEntity)
        ? "${baseResponse}.fromJson(json as $cast)"
        : "${baseResponse}.fromJson(json as $cast, (json) => ${model}.fromJson(json as Map<String, dynamic>))";
    return 'appRequest.${method}("/${endPoint}" , fromJson: (json) => ${fromJson}${queryParameters}${bodyParameters})';
  }

  bool _responseHaseFromJson(Either<CleanArchEntityItem, Type> responseEntity) {
    return responseEntity.fold(
      (l) {
        return false;
      },
      (r) => true,
    );
  }

  Class createClass();
}
