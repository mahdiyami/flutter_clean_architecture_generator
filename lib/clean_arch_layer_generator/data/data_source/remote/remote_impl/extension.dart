import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/remote/remote_impl/base_remote_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertRemoteDataSourceImplCreatorToCode on BaseRemoteDataSourceImplCreator {
  String _toCode() => createClass().convertClassToCode();

  void remoteDataSourceImplToCodeAllAndGenerateFiles() {
    CleanArchDataFileGenerator(feature).createRemoteDataSourceImplFile(_toCode());
  }
}
