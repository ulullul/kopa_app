class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static final RegExp _phoneRegExp = RegExp(
    r'^((\+38)+([0-9]){10})$',
  );
  static final RegExp _nameRegExp = RegExp(
    r"^[a-zA-Zа-яА-ЯІіЄєЇї.' -]+$",
  );
  static final _numberRegExp = RegExp(
    r"[0-9]",
  );

  static isNameValid(String name) {
    return _nameRegExp.hasMatch(name);
  }

  static isPhoneValid(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
