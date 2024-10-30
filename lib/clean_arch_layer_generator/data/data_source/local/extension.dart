import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/base_local_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/base_remote_data_source_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/repository_impl/base_repository_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertLocalDataSourceCreatorToCode on BaseLocalDataSourceCreator {
  String _toCode() => createClass().convertClassToCode();

  void localDataSourceToCodeAllAndGenerateFiles() {
    CleanArchDataFileGenerator(feature).createLocalDataSourceFile(_toCode());
  }
}
