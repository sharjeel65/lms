class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validatech({required String? ch}) {
    RegExp ChRegExp = RegExp(r"\d");
    if (ch == null) {
      return null;
    }

    if (ch.isEmpty) {
      return 'Credit Hour can\'t be empty';
    } else if (!ChRegExp.hasMatch(ch)) {
      return 'Credit hour can be a single digit value';
    } else if (int.parse(ch) > 3) {
      return 'Credit hour can\'t be greater than 3 ';
    } else if (int.parse(ch) < 1) {
      return 'Credit hour can\'t be less than 1 ';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp =
        RegExp(r"([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }

  static String? validateDOB({required String? dob}) {
    if (dob == null) {
      return null;
    }

    RegExp dobRegExp = RegExp(
        r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$");

    if (dob.isEmpty) {
      return 'Date of birth can\'t be empty';
    } else if (!dobRegExp.hasMatch(dob)) {
      return ' e.g DD/MM/YYYY';
    }
    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validateNumber({required String? number}) {
    RegExp CardRegExp =
        RegExp(r"([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})");
    if (number == null) {
      return null;
    }
    if (number.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }
}
