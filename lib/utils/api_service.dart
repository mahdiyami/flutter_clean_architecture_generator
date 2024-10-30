part of 'method_item.dart';

class RemoteDataSettings extends BaseService {
  final String endPoint;
  final String? baseUrl;
  final CleanArchRestApiMethodType method;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;

  const RemoteDataSettings({
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
