class FormValidationHelper {
  FormValidationHelper();

  static String? validateEmail(String? value) {
    final validEmail = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}"
        r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

    if (value == null || value.trim().isEmpty) {
      return "you must enter a value";
    }

    if (!validEmail.hasMatch(value)) {
      return "enter a valid email";
    }
    return null;
  }

  static String? validatePhoneNunmber(String? value) {
    final matchPhoneNumber =
        RegExp(r"^((\+)|(00)|(\*)|())[0-9]{3,14}((\#)|())$");
    // r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
    if (value == null || value.trim().isEmpty) {
      return "you must enter a value";
    }

    if (!matchPhoneNumber.hasMatch(value)) {
      return "you must enter a valid phone number";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "you must enter a value";
    }
    if (value.trim().length < 6) {
      return "must be 6 characters and above";
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "you must enter a value";
    }

    if (value.trim().length < 6) {
      return "this field must be more than 6 characters long";
    }
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    if (!alphanumeric.hasMatch(value)) {
      return "this field must not contain special characters";
    }

    return null;
  }

  static String? validateUsernameOrPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "you must enter a value";
    }

    if (value.trim().length < 6) {
      return "this field must be more than 6 characters long";
    }
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    if (!alphanumeric.hasMatch(value)) {
      return "this field must not contain special characters";
    }

    return null;
  }
}
