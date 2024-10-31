import 'package:code_builder/code_builder.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/base_local_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';
import 'package:flutter_clean_arch_generator/utils/base_method.dart';

class LocalDataSourceImplCreator extends BaseLocalDataSourceImplCreator {
  LocalDataSourceImplCreator({required super.feature});

  @override
  Class createClass( ) {
    List<LocalMethodItem> items = feature.methodItems.toLocalMethodItems;
    return Class((c) {
      c.name = 'AuthLocalDataSourceImpl';
      c.annotations.add(CodeExpression(Code('LazySingleton(as: AuthRemoteDataSource)')));
      c.extend = refer('AuthLocalDataSource');

      // Add constant field
      items.forEach((item) {
        c.fields.add(_field(item));
      });
      items.forEach((item) {
        c.methods.addAll(_methods(item));
      });
    });
  }

  Field _field(LocalMethodItem item) {
    return Field((f) {
      f.name = cacheKey(item);
      f.type = refer('String');
      f.modifier = FieldModifier.constant;
      f.assignment = Code('"${cacheKey(item)}"');
    });
  }

  List<Method> _methods(LocalMethodItem item) {
    return [
      // Add method: setToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.save, item);
        m.returns = refer('Future<void>');
        m.requiredParameters.add(Parameter((p) => p
          ..name = 'params'
          ..type = refer(item.params.toString())));
        m.modifier = MethodModifier.async;
        m.body = Code('''
          await localRequest.saveData<${_getType(item.params)}>(value: ${_saveData(item.params)}, key: _tokenKey);
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      }),
      // Add method: getToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.get, item);
        m.returns = refer(_getType(item.params));
        m.body = Code('''
        final data = localRequest.getData<${_getType(item.params)}>(_tokenKey);
        return ${_getData(item.params)};
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      }),
      // Add method: removeToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.remove, item);
        m.returns = refer('Future<void>');
        m.body = Code('''
        return localRequest.removeData(_tokenKey);
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      })
    ];
  }

  String _getType(Type params) {
    if (params == String) return 'String';
    if (params == bool) return 'bool';
    if (params == double) return 'double';
    if (params == int) return 'int';
    if (params == List<String>) return 'List<String>';
    return 'String'; // fallback
  }

  String _saveData(Type params) {
    if (params == String) return 'params';
    if (params == bool) return 'params';
    if (params == double) return 'params';
    if (params == int) return 'params';
    if (params == List<String>) return 'params';
    return 'jsonEncode(params.toJson())'; // fallback
  }

  String _getData(Type params) {
    if (params == String) return 'data';
    if (params == bool) return 'data';
    if (params == double) return 'data';
    if (params == int) return 'data';
    if (params == List<String>) return 'data';
    return 'jsonDecode(data)'; // fallback
  }
}
