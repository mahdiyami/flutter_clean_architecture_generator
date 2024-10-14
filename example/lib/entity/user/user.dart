import 'package:example/entity/address/address.dart';
import 'package:flutter_clean_arch_generator/domain/entity/utils/entity_item.dart';

final EntityItem userEntity = EntityItem(entityName: 'User', entityParams: [
  EntityParams(objectType: String, objectNameKey: 'id'),
  EntityParams(objectType: String, objectNameKey: 'name'),
  EntityParams(objectType: String, objectNameKey: 'password'),
  EntityParams(objectType: String, objectNameKey: 'phone'),
  EntityParams(objectType: addressEntity, objectNameKey: 'address'),
  EntityParams(objectType: String, objectNameKey: 'avatar'),
  EntityParams(objectType: String, objectNameKey: 'role'),
  EntityParams(objectType: String, objectNameKey: 'status'),
  EntityParams(objectType: String, objectNameKey: 'createdAt'),
  EntityParams(objectType: String, objectNameKey: 'updatedAt'),
]);
