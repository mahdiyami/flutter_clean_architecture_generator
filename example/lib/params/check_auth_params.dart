
import 'package:example/entity/address/address.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

final CleanArchParamsItem checkAuthParams = CleanArchParamsItem(paramsName: 'CheckAuth', paramsProperty: [
  ParamsProperty(objectType: String, objectNameKey: 'id'),
  ParamsProperty(objectType: bool, objectNameKey: 'isRegistered'),
  ParamsProperty(objectType: bool, objectNameKey: 'hasPassword'),

]);
