class AppStrings {
  AppStrings._();
  static String removeGenderString(String name) {
    String fixed_name = name.replaceAll(RegExp('-f|-m'), '');
    return fixed_name;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
