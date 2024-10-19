import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/extension/string.dart';
import 'package:flutter_clean_arch_generator/utils/method_item.dart';

mixin class CleanArchClassGenUtils {
  String eitherResponse(String responseName) {
    return 'FutureOr<Either<Failure, $responseName>>';
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
