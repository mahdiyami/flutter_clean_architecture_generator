
import 'package:example/entity/address/address.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

final CleanArchEntityItem checkAuthEntity = CleanArchEntityItem(entityName: 'CheckAuth', entityParams: [
  EntityParams(objectType: String, objectNameKey: 'id'),
  EntityParams(objectType: bool, objectNameKey: 'isRegistered'),
  EntityParams(objectType: bool, objectNameKey: 'hasPassword'),
  EntityParams(objectType: userEntity, objectNameKey: 'user' , nullable: true),

]);
