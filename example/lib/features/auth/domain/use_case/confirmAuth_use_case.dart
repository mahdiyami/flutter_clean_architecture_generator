import 'lib/base_export.dart';

@LazySingleton()
class ConfirmAuthUseCase extends UseCase<NoResponse<UserEntity>, CheckAuthParams> {
  const ConfirmAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Either<Failure, NoResponse> call(CheckAuthParams params) => _repository.confirmAuth(params);
}
