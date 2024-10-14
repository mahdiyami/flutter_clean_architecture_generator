import 'package:example/entity/address/address.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/domain/entity/utils/entity_item.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';

class ExampleCleanArchGeneratorConfig extends CleanArchGeneratorConfig {
  @override
  List<EntityItem> get entities => [userEntity, addressEntity];

  @override
  List<CleanArchFeature> get features => [
        ExampleCleanArchFeature(featureName: "auth", methodItems: [
          MethodItem(
            responseEntity: userEntity,
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
  final List<MethodItem> methodItems;

  ExampleCleanArchFeature({
    required this.featureName,
    required this.methodItems,
  });
}
