import 'package:flutter/material.dart';

abstract class AuthRepository extends RepositoryUtils {
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> checkAuth(String params);
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> confirmAuth(String params);
}
