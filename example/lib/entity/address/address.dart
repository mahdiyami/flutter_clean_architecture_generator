
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

final addressEntity = CleanArchEntityItem(entityName: 'Address', entityParams: [
  EntityProperty(objectType: String, objectNameKey: 'id'),
  EntityProperty(objectType: String, objectNameKey: 'name'),
  EntityProperty(objectType: String, objectNameKey: 'phone'),
  EntityProperty(objectType: String, objectNameKey: 'address'),
  EntityProperty(objectType: String, objectNameKey: 'status'),
  EntityProperty(objectType: String, objectNameKey: 'createdAt'),
  EntityProperty(objectType: String, objectNameKey: 'updatedAt'),
]);
