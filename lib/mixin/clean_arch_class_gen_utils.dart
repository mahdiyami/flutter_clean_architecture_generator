import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

mixin CleanArchClassGenUtils {
  String eitherResponse(BaseMethodItem item, {bool isFutureOr = false}) {
    String res = "Either<Failure, ${item.responseName}<${item.baseResponseType}>>";
    if (item.isFuture || isFutureOr) {
      String future = isFutureOr ? 'FutureOr' : 'Future';
      if (item.response == BaseResponseNames.noResponse) {
        return '${future}<Either<Failure, NoResponse>>';
      } else {
        return '${future}<${res}>';
      }
    } else {
      if (item.response == BaseResponseNames.noResponse) {
        return 'Either<Failure, NoResponse>';
      } else {
        return res;
      }
    }
  }

  String response(BaseMethodItem item, {bool isModel = false}) {
    String res = '${item.responseName}<${isModel ? item.baseResponseTypeModel : item.baseResponseType}>';
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

  String remoteDatasourceVariableName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterLowerCase}RemoteDataSource';
  }

  String localDatasourceName(CleanArchFeature feature) {
    return '${feature.featureName.firstLetterUpperCase}LocalDataSource';
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

  String useCaseName(String methodName) {
    return '${methodName.firstLetterUpperCase}UseCase';
  }
}
