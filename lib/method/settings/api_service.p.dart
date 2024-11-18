part of 'base_service.dart';

class RemoteDataSettings extends BaseService {
  final String endPoint;
  final String? baseUrl;
  final List<RemoteDataPathParams>? pathParams;
  final CleanArchRestApiMethodType method;
  final bool queryParameters;
  final bool body;

  const RemoteDataSettings({required this.endPoint, this.baseUrl, required this.method, this.queryParameters = false, this.body = false, this.pathParams})
      : assert(queryParameters == false || body == false);
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

class RemoteDataPathParams {
  final String key;
  final Type type;

  const RemoteDataPathParams({required this.key, required this.type});
}