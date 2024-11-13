import 'lib/base_export.dart';

@LazySingleton()
class AddToCartUseCase extends UseCase<BaseResponse<CheckAuthEntity>, CheckAuthParams> {
  const AddToCartUseCase(this._repository);

  final CartRepository _repository;

  @override
  Either<Failure, BaseResponse<CheckAuthEntity>> call(CheckAuthParams params) => _repository.addToCart(params);
}
