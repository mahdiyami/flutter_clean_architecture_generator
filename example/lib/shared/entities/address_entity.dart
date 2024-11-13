import 'lib/base_export.dart';

abstract class AddressEntity extends BaseEntity {
  String get id;
  String get name;
  String get phone;
  String get address;
  String get status;
  String get createdAt;
  String get updatedAt;
}
