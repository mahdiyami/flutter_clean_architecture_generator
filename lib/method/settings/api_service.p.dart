part of 'base_service.dart';

class RemoteDataSettings extends BaseService {
  final String endPoint;
  final String? baseUrl;
   final CleanArchRestApiMethodType method;
  final bool queryParameters;
  final bool body;

  const RemoteDataSettings({required this.endPoint, this.baseUrl, required this.method, this.queryParameters = false, this.body = false})
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
