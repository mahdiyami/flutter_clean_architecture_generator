import 'package:example/entity/address/address.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

final CleanArchEntityItem userEntity = CleanArchEntityItem(
    entityName: 'User',
    entityParams: [
  EntityProperty(objectType: String, objectNameKey: 'id'),
  EntityProperty(objectType: String, objectNameKey: 'name'),
  EntityProperty(objectType: String, objectNameKey: 'password'),
  EntityProperty(objectType: String, objectNameKey: 'phone'),
  EntityProperty(objectType: addressEntity, objectNameKey: 'address'),
  EntityProperty(objectType: String, objectNameKey: 'avatar'),
  EntityProperty(objectType: String, objectNameKey: 'role'),
  EntityProperty(objectType: String, objectNameKey: 'status'),
  EntityProperty(objectType: String, objectNameKey: 'createdAt'),
  EntityProperty(objectType: String, objectNameKey: 'updatedAt'),
]);
