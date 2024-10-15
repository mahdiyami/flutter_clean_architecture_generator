import 'package:example/entity/address/address.dart';
import 'package:example/entity/auth/auth_check.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class ExampleCleanArchGeneratorConfig extends CleanArchGeneratorConfig {
  @override
  List<CleanArchEntityItem> get sharedEntities => [userEntity, addressEntity];

  @override
  List<CleanArchFeature> get features => [
        ExampleCleanArchFeature(featureName: "auth", entities: [
          authCheckEntity,
          userEntity,
        ], methodItems: [
          MethodItem(
            responseEntity: authCheckEntity,
            params: String,
            methodName: 'checkAuth',
            response: BaseResponseNames.baseResponse,
          ),
          MethodItem(
            responseEntity: userEntity,
            params: String,
            methodName: 'confirmAuth',
            response: BaseResponseNames.baseResponse,
          ),
        ])
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
