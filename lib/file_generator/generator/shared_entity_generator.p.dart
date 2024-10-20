part of 'file_generator.dart';

class CleanArchSharedEntityFileGenerator extends CleanArchFileGenerator {
  String get _currentSharedEntityPath => "${config.sharedEntity.directory}/entities";
  String get _currentSharedEntityParamsPath => "${config.sharedEntity.directory}/params";

  Future<void> createSharedEntityFile(String content, {required CleanArchEntityItem item}) async {
    if (!item.isParams)
      await createFile('$_currentSharedEntityPath/${item.entityName.firstLetterLowerCase}_entity.dart', content: content);
    else
      await createFile('$_currentSharedEntityParamsPath/${item.entityName.firstLetterLowerCase}_params.dart', content: content);
  }
}
