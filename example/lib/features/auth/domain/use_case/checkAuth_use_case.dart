import 'package:flutter/material.dart';

@LazySingleton()
class CheckAuthUseCase extends UseCase<BaseResponse<UserEntity>, String> {
  const CheckAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> call(String params) => _repository.checkAuth(params);
}
