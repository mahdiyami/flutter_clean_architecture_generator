import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

enum BaseResponseNames {
  baseResponse(currentName: "BaseResponse"),
  basePaginationResponse(currentName: "BasePaginationResponse"),
  baseListResponse(currentName: "BaseListResponse"),
  noResponse(currentName: "NoResponse"),;

  final String currentName;

  const BaseResponseNames({required this.currentName});
}

class MethodItem {
  final String methodName;
  final Type params;
  final BaseResponseNames response;
  final CleanArchEntityItem responseEntity;
  final ApiServiceSettings? apiServiceSettings;
  final bool isFuture;
  final bool isLocalData;
  final bool isCachedResponse;

  MethodItem({
    required this.methodName,
    required this.params,
    required this.response,
    required this.responseEntity,
    this.apiServiceSettings,
    this.isFuture = true,
    this.isLocalData = false,
    this.isCachedResponse = false,
  });

  String get responseName => response.currentName;
  String get baseResponseType => responseEntity.toString();
  String get baseResponseTypeModel => responseEntity.toString().replaceAll("Entity", 'Model');
  String get paramsName => params.toString();
}

class ApiServiceSettings {
  final String endPoint;
  final String? baseUrl;
  final CleanArchRestApiMethodType method;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;

  const ApiServiceSettings({
    required this.endPoint,
    this.baseUrl,
    required this.method,
    this.queryParameters,
    this.headers,
    this.body,
  });
}

enum CleanArchRestApiMethodType {
  GET(methodName: "get"),
  POST(methodName: "post"),
  PUT(methodName: "put"),
  DELETE(methodName: "delete"),
  PATCH(methodName: "patch");

  final String methodName;

  const CleanArchRestApiMethodType({required this.methodName});
}
