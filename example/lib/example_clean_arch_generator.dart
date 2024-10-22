import 'package:example/entity/address/address.dart';
import 'package:example/entity/auth/check_auth.dart';
import 'package:example/entity/user/user.dart';
import 'package:example/params/check_auth_params.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/params/utils/params_item.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ExampleCleanArchGeneratorConfig extends CleanArchGeneratorConfig {
  @override
  List<CleanArchEntityItem> get sharedEntities => [userEntity, addressEntity];
  @override
   List<CleanArchParamsItem> get sharedParams => [];
  @override
  List<CleanArchFeature> get features => [
        ExampleCleanArchFeature(featureName: "auth",
            params: [
              checkAuthParams
            ],
            entities: [
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

    ExampleCleanArchFeature(featureName: "cart",
        params: [

        ],
        entities: [
      checkAuthEntity,
      userEntity,
    ], methodItems: [
      MethodItem(
        responseEntity: checkAuthEntity,
        params: bool,
        methodName: 'addToCart',
        response: BaseResponseNames.baseResponse,
        isLocalData: true,
        apiServiceSettings: ApiServiceSettings(
          endPoint: 'addToCart',
          method: CleanArchRestApiMethodType.POST,
        ),
      ),
      MethodItem(
        responseEntity: userEntity,
        params: String,
        methodName: 'removeFromCart',
        isLocalData: true,
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

  @override
  final List<CleanArchParamsItem> params;

  ExampleCleanArchFeature({
    required this.featureName,
    required this.entities,
    required this.methodItems,
    required this.params,
  });


}
