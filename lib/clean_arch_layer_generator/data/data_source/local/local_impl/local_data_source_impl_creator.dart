import 'package:code_builder/code_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

class LocalDataSourceImplCreator extends BaseLocalDataSourceImplCreator {
  LocalDataSourceImplCreator({required super.feature});

  @override
  Class createClass() {
    List<LocalMethodItem> items = feature.methodItems.toLocalMethodItems;
    return Class((c) {
      c.name = localDataSourceImplName();
      c.annotations.add(CodeExpression(Code('LazySingleton(as: ${localDataSourceName()})')));
      c.extend = refer(localDataSourceName());
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
      f.static = true;
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
          ..type = refer(item.params1Name.toString())));
        m.modifier = MethodModifier.async;
        m.body = Code('''
          await localRequest.saveData<${_getType(item.params1)}>(value: ${_saveData(item.params1)}, key: ${cacheKey(item)});
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      }), // Add method: getToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.get, item);
        m.returns = refer(_getType(item.params1));
        m.body = Code('''
        final data = localRequest.getData<${_getType(item.params1)}>(${cacheKey(item)});
        return ${_getData(item.params1)};
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      }), // Add method: removeToken
      Method((m) {
        m.name = methodName(LocalDataMethodType.remove, item);
        m.returns = refer('Future<void>');
        m.body = Code('''
        return localRequest.removeData(${cacheKey(item)});
      ''');
        m.annotations.add(CodeExpression(Code('override')));
      })
    ];
  }

  String _getType(Either<CleanArchParamsItem, Type> params) {
    return params.fold(
      (l) {
        return "String";
      },
      (type) {
        switch (type) {
          case String:
            return 'String';
          case bool:
            return 'bool';
          case double:
            return 'double';
          case int:
            return 'int';
          case const (List<String>):
            return 'List<String>';
          default:
            throw UnimplementedError('Type $type is not supported');
        }
      },
    );
  }

  String _saveData(Either<CleanArchParamsItem, Type> params) {
    return params.fold(
      (l) {
        return 'jsonEncode(params.toJson())';
      },
      (type) {
        switch (type) {
          case String:
            return 'params';
          case bool:
            return 'params';
          case double:
            return 'params';
          case int:
            return 'params';
          case const (List<String>):
            return 'params';
          default:
            throw UnimplementedError('Type $type is not supported');
        }
      },
    );
  }

  String _getData(Either<CleanArchParamsItem, Type> params) {
    return params.fold(
      (l) {
        return 'jsonDecode(data)';
      },
      (type) {
        switch (type) {
          case String:
            return 'data';
          case bool:
            return 'data';
          case double:
            return 'data';
          case int:
            return 'data';
          case const (List<String>):
            return 'data';
          default:
            throw UnimplementedError('Type $type is not supported');
        }
      },
    );
  }
}
