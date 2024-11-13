import 'lib/base_export.dart';

@LazySingleton()
class UserUseCase extends UseCase<BaseResponse<UserEntity>, CheckAuthParams> {
  const UserUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Either<Failure, BaseResponse<UserEntity>> call(CheckAuthParams params) => _repository.user(params);
}
