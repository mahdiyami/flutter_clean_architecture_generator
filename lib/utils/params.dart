
class CleanArchGenParamsUtils {
  static String convertListStringToParams(List<String?> list) {
    if(list.length > 1) {
      // remove null values
      list.removeWhere((element) => element == null);
      return list.join(', ');
    }
    return  list.firstOrNull ?? '';
  }
}