import 'lib/base_export.dart';

@LazySingleton()
class CheckAuthUseCase extends UseCase<BaseResponse<CheckAuthEntity>, CheckAuthParams> {
  const CheckAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Either<Failure, BaseResponse<CheckAuthEntity>> call(CheckAuthParams params) => _repository.checkAuth(params);
}
