import 'lib/base_export.dart';

@LazySingleton()
class TokenUseCase extends UseCase<BaseResponse<CheckAuthEntity>, bool> {
  const TokenUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Either<Failure, BaseResponse<CheckAuthEntity>> call(bool params) => _repository.token(params);
}
