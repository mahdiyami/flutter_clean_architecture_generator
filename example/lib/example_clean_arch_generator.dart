import 'package:example/entity/address/address.dart';
import 'package:example/entity/auth/check_auth.dart';
import 'package:example/entity/user/user.dart';
import 'package:example/params/check_auth_params.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ExampleCleanArchGeneratorConfig extends CleanArchGeneratorConfig {
  @override
  List<CleanArchEntityItem> get sharedEntities => [userEntity, addressEntity];
  @override
  List<CleanArchParamsItem> get sharedParams => [];
  @override
  List<CleanArchFeature> get features => [
        ExampleCleanArchFeature(featureName: "auth", params: [
          checkAuthParams
        ], entities: [
          checkAuthEntity,
        ], methodItems: [
          MethodItem<RemoteDataSettings>(
            responseEntity: checkAuthEntity,
            params: String,
            methodName: 'checkAuth',
            isFuture: false,
            response: BaseResponseNames.baseResponse,
            serviceSettings: RemoteDataSettings(
              endPoint: 'checkAuth',
              method: CleanArchRestApiMethodType.GET,
            ),
          ),
          MethodItem<LocalDataServiceSettings>(
            responseEntity: checkAuthEntity,
            params: String,
            methodName: 'token',
             isFuture: false,
            response: BaseResponseNames.baseResponse,
            serviceSettings: LocalDataServiceSettings(),
          ),
          MethodItem<RemoteDataSettings>(
            responseEntity: userEntity,
            params: String,
            methodName: 'confirmAuth',
            serviceSettings: RemoteDataSettings(
              endPoint: 'confirmAuth',
              method: CleanArchRestApiMethodType.POST,
            ),
            response: BaseResponseNames.noResponse,
          ),
        ]),
        ExampleCleanArchFeature(featureName: "cart", params: [], entities: [
          checkAuthEntity,
          userEntity,
        ], methodItems: [
          MethodItem(
            responseEntity: checkAuthEntity,
            params: bool,
            methodName: 'addToCart',
            response: BaseResponseNames.baseResponse,
            serviceSettings: RemoteDataSettings(
              endPoint: 'addToCart',
              method: CleanArchRestApiMethodType.POST,
            ),
          ),
          MethodItem(
            responseEntity: userEntity,
            params: String,
            methodName: 'removeFromCart',
            response: BaseResponseNames.baseResponse,
            serviceSettings: RemoteDataSettings(
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

  @override
  CleanArchFeature copyWith({
    String? featureName,
    List<CleanArchEntityItem>? entities,
    List<MethodItem>? methodItems,
    List<CleanArchParamsItem>? params,
  }) {
    return ExampleCleanArchFeature(
      featureName: featureName ?? this.featureName,
      entities: entities ?? this.entities,
      methodItems: methodItems ?? this.methodItems,
      params: params ?? this.params,
    );
  }
}
