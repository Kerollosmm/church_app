// validators.dart
//
// PURPOSE:
// Common validation functions (email, password, etc.).

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    // regex check
    return null;
  }
}
