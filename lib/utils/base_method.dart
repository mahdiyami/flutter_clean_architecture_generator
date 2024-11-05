// extends ApiServiceSettings or LocalDataServiceSettings
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

part "local_method_item.p.dart";
part "remote_method_item.p.dart";

abstract class BaseMethodItem {
  final String methodName;
  final Either<CleanArchParamsItem , Type> params;
  final BaseResponseNames response;
  final CleanArchEntityItem responseEntity;
  final bool isFuture;

  BaseMethodItem({
    required this.methodName,
    required this.params,
    required this.response,
    required this.responseEntity,
    this.isFuture = false,
  });

  String get responseName => response.currentName;
  String get baseResponseType => responseEntity.toString();
  String get baseResponseTypeModel => responseEntity.toString().replaceAll("Entity", 'Model');
  String get paramsName => params.fold((l) => l.toString(), (r) => r.toString());
}

extension BaseMethodItemToRemoteOrLocal on BaseMethodItem {
  RemoteMethodItem get toRemoteMethodItem {
    if (this is RemoteMethodItem) return this as RemoteMethodItem;
    throw UnimplementedError("BaseMethodItem is not subtype of LocalMethodItem or RemoteMethodItem");
  }

  LocalMethodItem get toLocalMethodItem {
    if (this is LocalMethodItem) return this as LocalMethodItem;

    throw UnimplementedError("BaseMethodItem is not subtype of LocalMethodItem or RemoteMethodItem");
  }
}

extension ListBaseMethodItemToRemoteOrLocal on List<BaseMethodItem> {
  List<RemoteMethodItem> get toRemoteMethodItems {
    return map((e) => e.toRemoteMethodItem).toList();
  }

  List<LocalMethodItem> get toLocalMethodItems {
    return map((e) => e.toLocalMethodItem).toList();
  }
}
