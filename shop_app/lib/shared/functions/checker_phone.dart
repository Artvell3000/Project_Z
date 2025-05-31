abstract class CheckerPhone {
  static bool isUzPhoneNumber(String phone) {
    final RegExp regExp = RegExp(r'^\+998\s\(\d{2}\)\s\d{3}\s\d{2}\s\d{2}$');
    return regExp.hasMatch(phone);
  }
}
