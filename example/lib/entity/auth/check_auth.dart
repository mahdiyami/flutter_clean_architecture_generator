
import 'package:example/entity/address/address.dart';
import 'package:example/entity/user/user.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

final CleanArchEntityItem checkAuthEntity = CleanArchEntityItem(entityName: 'CheckAuth', entityParams: [
  EntityProperty(objectType: String, objectNameKey: 'id'),
  EntityProperty(objectType: bool, objectNameKey: 'isRegistered'),
  EntityProperty(objectType: bool, objectNameKey: 'hasPassword'),
  EntityProperty(objectType: userEntity, objectNameKey: 'user' , nullable: true),

]);
