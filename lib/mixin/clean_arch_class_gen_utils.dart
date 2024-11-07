import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/base_local_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

mixin CleanArchClassGenUtils {
  String futureOrBasicResponse(String item) {
   return 'FutureOr<$item>';
  }
  String eitherResponse(BaseMethodItem item, {bool isFutureOr = false}) {
    String res = "Either<Failure, ${item.responseName}>";
    if (item.isFuture || isFutureOr) {
      String future = isFutureOr ? 'FutureOr' : 'Future';
      if (item.response == BaseResponseNames.noResponse) {
        return '${future}<Either<Failure, ${item.responseEntity.fold((l) => "NoResponse", (r) => item.responseName,)}>>';
      } else {
        return '${future}<${res}>';
      }
    } else {
      if (item.response == BaseResponseNames.noResponse) {
        return 'Either<Failure, ${item.responseEntity.fold((l) => "NoResponse", (r) => item.responseName,)}>';
      } else {
        return res;
      }
    }
  }

  String response(BaseMethodItem item, {bool isModel = false}) {
    String res = item.responseNameModel;
    if (item.isFuture) {
      if (item.response == BaseResponseNames.noResponse) {
        return "Future<${item.responseName}>";
      } else {
        return 'Future<$res>';
      }
    } else {
      if (item.response == BaseResponseNames.noResponse) {
        return item.responseName;
      } else {
        return res;
      }
    }
  }

  String remoteDatasourceName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterUpperCase}RemoteDataSource';
  }
  String baseRemoteDatasourceName(CleanArchFeature feature) {
    return 'BaseRemoteDataSource';
  }
  String remoteDatasourceImplName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterUpperCase}RemoteDataSourceImpl';
  }

  String remoteDatasourceVariableName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterLowerCase}RemoteDataSource';
  }

  String localDatasourceName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterUpperCase}LocalDataSource';
  }
  String baseLocalDatasourceName(CleanArchFeature feature) {
    return 'BaseLocalDataSource';
  }

  String localDatasourceVariableName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterLowerCase}LocalDataSource';
  }

  String dataSourceViaBaseMethodItem(BaseMethodItem methodItem, {required CleanArchFeature feature}) {
    if (methodItem is LocalMethodItem) {
      return localDatasourceName(feature);
    } else {
      return remoteDatasourceName(feature);
    }
  }

  String dataSourceVariableViaBaseMethodItem(BaseMethodItem methodItem, {required CleanArchFeature feature}) {
    if (methodItem is LocalMethodItem) {
      return localDatasourceVariableName(feature);
    } else {
      return remoteDatasourceVariableName(feature);
    }
  }

  String repositoryName(String featureName) {
    return '${featureName.firstLetterUpperCase}Repository';
  }

  String repositoryImplName(String featureName) {
    return '${featureName.firstLetterUpperCase}RepositoryImpl';
  }

  String entityName(String entityName) {
    return '${entityName.firstLetterUpperCase}Entity';
  }

  String modelName(String entityName) {
    if (entityName.contains("Entity")) {
      return entityName.replaceAll('Entity', 'Model');
    }
    return '${entityName.firstLetterUpperCase}Model';
  }
  String fileModelName(String entityName) {
    if (entityName.contains("Entity")) {
      return "${entityName.firstLetterLowerCase}_model";
    }
    return '${entityName.firstLetterLowerCase}_model';
  }
  String fileParamsName(String entityName) {
    if (entityName.contains("Entity")) {
      return "${entityName.firstLetterLowerCase}_params";
    }
    return '${entityName.firstLetterLowerCase}_params';
  }

  String useCaseName(String methodName) {
    return '${methodName.firstLetterUpperCase}UseCase';
  }
  String methodName(LocalDataMethodType type, LocalMethodItem item) {
    return "${type.name}${item.methodName.firstLetterUpperCase}";
  }
}
