import 'lib/base_export.dart';

abstract class UserEntity extends BaseEntity {
  String get id;
  String get name;
  String get password;
  String get phone;
  AddressEntity get address;
  String get avatar;
  String get role;
  String get status;
  String get createdAt;
  String get updatedAt;
}
