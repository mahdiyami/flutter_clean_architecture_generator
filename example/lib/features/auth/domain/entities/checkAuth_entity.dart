import 'lib/base_export.dart';

abstract class CheckAuthEntity extends BaseEntity {
  String get id;
  bool get isRegistered;
  bool get hasPassword;
  UserEntity? get user;
}
