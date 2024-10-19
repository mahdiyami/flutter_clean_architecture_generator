import 'package:example/entity/address/address.dart';
import 'package:example/entity/auth/check_auth.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ExampleCleanArchGeneratorConfig extends CleanArchGeneratorConfig {
  @override
  List<CleanArchEntityItem> get sharedEntities => [userEntity, addressEntity];

  @override
  List<CleanArchFeature> get features => [
        ExampleCleanArchFeature(featureName: "auth", entities: [
          checkAuthEntity,
          userEntity,
        ], methodItems: [
          MethodItem(
            responseEntity: checkAuthEntity,
            params: String,
            methodName: 'checkAuth',
            isLocalData: true,
            isFuture: false,
            response: BaseResponseNames.baseResponse,
            apiServiceSettings: ApiServiceSettings(
              endPoint: 'checkAuth',
              method: CleanArchRestApiMethodType.GET,
            ),
          ),
          MethodItem(
            responseEntity: userEntity,
            params: String,
            methodName: 'confirmAuth',
            apiServiceSettings: ApiServiceSettings(
              endPoint: 'confirmAuth',
              method: CleanArchRestApiMethodType.POST,
            ),
            response: BaseResponseNames.noResponse,
          ),
        ]),

    ExampleCleanArchFeature(featureName: "cart", entities: [
      checkAuthEntity,
      userEntity,
    ], methodItems: [
      MethodItem(
        responseEntity: checkAuthEntity,
        params: bool,
        methodName: 'addToCart',
        response: BaseResponseNames.baseResponse,
        apiServiceSettings: ApiServiceSettings(
          endPoint: 'addToCart',
          method: CleanArchRestApiMethodType.POST,
        ),
      ),
      MethodItem(
        responseEntity: userEntity,
        params: String,
        methodName: 'removeFromCart',
        response: BaseResponseNames.baseResponse,
        apiServiceSettings: ApiServiceSettings(
          endPoint: 'removeFromCart',
          method: CleanArchRestApiMethodType.POST,
        ),
      ),
    ]),
      ];
}

class ExampleCleanArchFeature extends CleanArchFeature {
  @override
  final String featureName;
  @override
  final List<CleanArchEntityItem> entities;
  @override
  final List<MethodItem> methodItems;

  ExampleCleanArchFeature({
    required this.featureName,
    required this.entities,
    required this.methodItems,
  });
}
