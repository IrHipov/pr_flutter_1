import 'package:pr_flutter_1/res/strings.dart';

class CustomValidator {
  static String? _validate(String? value, String regRxp, String fieldNanme){
    RegExp regExp = new RegExp(regRxp);

    if (value == '' || value == null) {
      return Strings.FIELD_IS_EMPTY;
    }

    if (value.length > 255) {
      return Strings.FIELD_IS_TOO_LONG;
    }

    if (!regExp.hasMatch(value)) {
      return Strings.fieldIsInvalid(fieldNanme);
    }
    return null;
  }

  static String? emailValidator(String? value) {
    String regExp = r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$';
    return _validate(value, regExp, "Email");
  }

  static String? nameValidator(String? value) {
    String regExp = r'^[A-Z]{1}[a-z0-9_-]{3,16}$';
    return _validate(value, regExp, "Name");
  }

  static String? passValidator(String? value) {
    String regExp = r'(?=(.*[0-9]))((?=.*[A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z]))^.{8,}$';
    return _validate(value, regExp, "Password");
  }

  static String? fieldMatchValidator(String? value, String? confirmValue){
    if (value == confirmValue && value != null){
      return null;
    }
    return Strings.FIELDS_DIFFERENT;
  }
}
