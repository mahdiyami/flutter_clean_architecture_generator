// extends ApiServiceSettings or LocalDataServiceSettings
import 'dart:ffi';

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

part "local_method_item.p.dart";
part "remote_method_item.p.dart";
typedef ResponseEntity = Either<CleanArchEntityItem, Either<Type, String>>;
abstract class BaseMethodItem {
  final String methodName;
  final Either<CleanArchParamsItem, Type> params;
  final Either<CleanArchParamsItem, Type> pathParams ;
  final BaseResponseNames response;
  final ResponseEntity responseEntity;
  final bool isFuture;

  BaseMethodItem({
    required this.methodName,
      this.params = const Right(Null),
      this.pathParams  = const Right(Null),
    required this.response,
    required this.responseEntity,
    this.isFuture = true,
  });
//example BaseResponse<ExampleEntity>
  String get responseName {
    if (response == BaseResponseNames.noResponse) {
      return "${baseResponseType}";
    }
    String responseName = responseEntity.fold(
          (l) => response.currentName,
          (r) {
        return r.fold((l) => BaseResponseNames.baseTypeResponse.currentName, (r) => response.currentName,);
      },
    );
    return "${responseName}<${baseResponseType}>";
  }
//example BaseResponse<ExampleModel>
  String get responseNameModel {
    String responseName = responseEntity.fold(
          (l) => response.currentName,
          (r) {
           return r.fold((l) => BaseResponseNames.baseTypeResponse.currentName, (r) => response.currentName,);
          },
    );
    if (response == BaseResponseNames.noResponse) {
      return baseResponseTypeModel;
    }
    return "${responseName}<${baseResponseTypeModel}>";
  }

  String get baseResponseType => responseEntity.fold((l) => l.toString(), (r) {
    return r.fold((l) {
      if(l == Void){
        return "void";
      }
      return l.toString();
    },  (r) => r.toString(),);
  });
  String get baseResponseTypeModel => baseResponseType.replaceAll("Entity", 'Model');
  String get paramsName => params.fold((l) => l.toString(), (r) {
        if (r == Null) {
          return "NoParams";
        }
        return r.toString();
      });
  String get pathParamsName => pathParams.fold((l) => l.toString(), (r) {
    if (r == Null) {
      return "NoParams";
    }
    return r.toString();
  });
  bool get hasParams => params.fold((l) => true, (r) => r != Null);
  bool get hasPathParams => pathParams .fold((l) => true, (r) => r != Null);
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
