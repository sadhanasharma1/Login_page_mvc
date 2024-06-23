import 'package:flutter/material.dart';
import 'package:mvc_flutter/models/user.dart';
import 'package:mvc_flutter/services/auth_service.dart';

class LoginController {
  final AuthService _authService = AuthService(); // Singleton instance

  Future<void> login(BuildContext context, String username, String password) async {
    User user = User(username: username, password: password);
    bool success = await _authService.login(user);
    if (success) {
      print('Login successful for $username');
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Login failed for $username');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  Future<void> signup(BuildContext context, String username, String password) async {
    User user = User(username: username, password: password);
    bool success = await _authService.signup(user);
    if (success) {
      print('Signup successful for $username');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup successful')));
      Navigator.pop(context); // Go back to the login page after successful signup
    } else {
      print('Signup failed for $username');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed')));
    }
  }
}
