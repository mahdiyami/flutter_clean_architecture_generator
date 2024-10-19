import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';

mixin class CleanArchClassGenUtils {
  String eitherResponse(MethodItem item) {
    String future = item.isFuture ? 'FutureOr<Either<Failure, ${item.responseName}<${item.baseResponseType}>>>' : '';
    if(item.response == BaseResponseNames.noResponse) {
      return 'FutureOr<Either<Failure, NoResponse>>';
    }
    else {
      return 'FutureOr<>';
    }
   }
  String response(MethodItem item , { bool isModel = false}) {
    if(item.response == BaseResponseNames.noResponse) {
      return item.responseName;
    }
    else {
      return '${item.responseName}<${isModel ? item.baseResponseTypeModel: item.baseResponseType}>';
    }
  }
  String futureResponse(String responseName) {
    return 'FutureOr<$responseName>';
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
  String dataSourceViaMethodItem(MethodItem methodItem , {required CleanArchFeature feature}) {
    if(methodItem.isLocalData) {
      return localDatasourceName(feature);
    }else{
      return remoteDatasourceName(feature);
    }
  }
  String dataSourceVariableViaMethodItem(MethodItem methodItem , {required CleanArchFeature feature}) {
    if(methodItem.isLocalData) {
      return localDatasourceVariableName(feature);
    }else{
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
    if(entityName.contains("Entity")) {
      return entityName.replaceAll('Entity', 'Model');
    }
    return '${entityName.firstLetterUpperCase}Model';
  }
  String modelFreezedMixinName(String entityName) {
    return '_\$${entityName.firstLetterUpperCase}Model';
  }
  String modelConstructorFreezedMixinName(String entityName) {
    return '_${entityName.firstLetterUpperCase}Model';
  }

  String useCaseName(String methodName) {
    return '${methodName.firstLetterUpperCase}UseCase';
  }
}
