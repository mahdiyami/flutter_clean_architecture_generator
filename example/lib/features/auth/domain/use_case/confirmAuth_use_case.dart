import 'lib/base_export.dart';

@LazySingleton()
class ConfirmAuthUseCase extends UseCase<BaseResponse<UserEntity>, String> {
  const ConfirmAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  FutureOr<Either<Failure, BaseResponse<UserEntity>>> call(String params) => _repository.confirmAuth(params);
}
