import 'lib/base_export.dart';

@LazySingleton()
class CheckAuthUseCase extends UseCase<BaseResponse<CheckAuthEntity>, String> {
  const CheckAuthUseCase(this._repository);

  final AuthRepository _repository;

  @override
  FutureOr<Either<Failure, BaseResponse<CheckAuthEntity>>> call(String params) => _repository.checkAuth(params);
}
