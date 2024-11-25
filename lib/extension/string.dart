

extension UtilsOnString on String {
  String get firstLetterUpperCase => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get firstLetterLowerCase => isNotEmpty ? '${this[0].toLowerCase()}${substring(1)}' : '';
  String get removeIfExistFirstLetterSlash => startsWith('/') ? substring(1) : this;

  String get removeIfExistLastLetterSlash => startsWith('/') ? substring(0, length - 1) : this;
}