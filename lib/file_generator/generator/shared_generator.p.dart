part of 'file_generator.dart';

class CleanArchSharedFileGenerator extends CleanArchFileGenerator {
  String get _currentSharedEntityPath => "${config.sharedEntity.directory}/entities";
  String get _currentSharedEntityParamsPath => "${config.sharedEntity.directory}/params";

  Future<void> createSharedEntityFile(String content, {required CleanArchEntityItem item}) async {
    await createFile('$_currentSharedEntityPath/${item.entityName.firstLetterLowerCase}_entity.dart', content: content);

  }
  Future<void> createSharedParamsFile(String content, {required CleanArchParamsItem item}) async {
    await createFile('$_currentSharedEntityParamsPath/${item.paramsName.firstLetterLowerCase}_params.dart', content: content);

  }
}
