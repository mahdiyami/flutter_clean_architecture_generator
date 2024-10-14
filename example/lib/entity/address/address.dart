import 'package:flutter_clean_arch_generator/domain/entity/utils/entity_item.dart';

final addressEntity = EntityItem(entityName: 'Address', entityParams: [
  EntityParams(objectType: String, objectNameKey: 'id'),
  EntityParams(objectType: String, objectNameKey: 'name'),
  EntityParams(objectType: String, objectNameKey: 'phone'),
  EntityParams(objectType: String, objectNameKey: 'address'),
  EntityParams(objectType: String, objectNameKey: 'status'),
  EntityParams(objectType: String, objectNameKey: 'createdAt'),
  EntityParams(objectType: String, objectNameKey: 'updatedAt'),
]);
