class TextFieldValidator {
 TextFieldValidator._() ;

  String? validateEmail(String? value) {
if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(emailPattern);

      if (!regex.hasMatch(value)) {
        return 'Enter a valid email';
      }
      return null;

      
  }
}

class CustomValidator {

  static const String validatePassword = 'password';
  static const String validateEmaile = 'email';
  static const String validateName = 'name';
  
  final String validateType;

  CustomValidator(this.validateType);

  String? call(String? value) {
    if (validateType == 'password') {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      if (value.length < 6) {
        return 'Password must be at least 6 characters';
      }
      // Password should contain at least one uppercase letter, one lowercase letter, and one number
      String passwordPattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)';
      RegExp regex = RegExp(passwordPattern);

      if (!regex.hasMatch(value)) {
        return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
      }
      return null;
    } else if (validateType == 'email') {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(emailPattern);

      if (!regex.hasMatch(value)) {
        return 'Enter a valid email';
      }
      return null;
    } else if (validateType == 'userName') {
      if (value == null || value.isEmpty) {
        return 'Username is required';
      }
      if (value.contains(' ')) {
        return 'Username cannot contain spaces';
      }
      if (value.length < 3) {
        return 'Username must be at least 3 characters';
      }
      return null; // ✅ No error
    } else {
      return null;
    }
  }
}
