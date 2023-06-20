class LoginException implements Exception {
  final String message = 'Wrong email or password, try again';
  
  @override
  String toString() => message;
}