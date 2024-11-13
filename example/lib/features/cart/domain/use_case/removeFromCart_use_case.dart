import 'lib/base_export.dart';

@LazySingleton()
class RemoveFromCartUseCase extends UseCase<BaseResponse<UserEntity>, CheckAuthParams> {
  const RemoveFromCartUseCase(this._repository);

  final CartRepository _repository;

  @override
  Either<Failure, BaseResponse<UserEntity>> call(CheckAuthParams params) => _repository.removeFromCart(params);
}
