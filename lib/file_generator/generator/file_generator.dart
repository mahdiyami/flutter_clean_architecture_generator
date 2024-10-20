import 'dart:io';

import 'package:flutter_clean_arch_generator/flutter_clean_arch_generator.dart';

part 'data_layer_generator.p.dart';

part 'domain_layer_generator.p.dart';

part 'shared_entity_generator.p.dart';

abstract class CleanArchFileGenerator with FileCreatorUtils {


  CleanArchYamlConfig get config => CleanArchYamlConfig.loadCleanArchYamlConfig();




}
