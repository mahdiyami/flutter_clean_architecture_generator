import 'package:flutter_clean_arch_generator/clean_arch_generator_config.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/entity/entity_creator.dart';
import 'package:flutter_clean_arch_generator/clean_arch_layer_generator/domain/entity/extension.dart';
import 'package:flutter_clean_arch_generator/shared_generator/base_shared_creator.dart';

class SharedCreator extends BaseSharedCreator {
  SharedCreator({required super.shared});

  @override
  void createShared() {
    EntityCreator().sharedEntityToCodeAllAndGenerateFiles(shared);
  }
}
