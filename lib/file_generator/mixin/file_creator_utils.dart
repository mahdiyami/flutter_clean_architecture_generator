

import 'dart:io';

mixin FileCreatorUtils {
  Future<void> createFile(String path , {String? content}) async {
    File dataSourceFile = File(path);
    if (!(await dataSourceFile.exists())) {
      await dataSourceFile.create(recursive: true);

    }
    dataSourceFile.writeAsStringSync(content ?? '');


  }

}