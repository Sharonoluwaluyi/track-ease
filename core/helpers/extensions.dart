extension NullCheck on Object? {
  bool get isNull => this == null || this == 'null';
}

extension EmailValidator on String {
  bool isEmailValid() {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegex.hasMatch(this);
  }

  bool get isEmail => isEmailValid();
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return length >= 6;
  }

  bool get isPassword => isValidPassword();
}

extension StringExtension on String {
  String capitalizeString() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
  String get capitalize => capitalizeString();
}
