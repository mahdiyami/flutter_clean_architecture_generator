import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/data/data_source/local/local_impl/base_local_data_source_impl_creator.dart';
import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

extension ConvertLocalDataSourceImplCreatorToCode on BaseLocalDataSourceImplCreator {
  String _toCode( ) => createClass().convertClassToCode();

  void localDataSourceImplToCodeAllAndGenerateFiles() {

    CleanArchDataFileGenerator(feature).createLocalDataSourceImplFile(_toCode());
  }
}
