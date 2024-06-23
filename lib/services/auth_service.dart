// import 'package:mvc_flutter/models/user.dart';

// class AuthService {
//   // Singleton pattern
//   static final AuthService _instance = AuthService._internal();

//   factory AuthService() {
//     return _instance;
//   }

//   AuthService._internal();

//   List<User> _registeredUsers = [];

//   Future<bool> login(User user) async {
//     await Future.delayed(Duration(seconds: 2));
//     print('Attempting login for ${user.username}');
//     print('Registered users: ${_registeredUsers.map((u) => u.username).toList()}');
//     return _registeredUsers.any((u) => u.username == user.username && u.password == user.password);
//   }

//   Future<bool> signup(User user) async {
//     await Future.delayed(Duration(seconds: 2));
//     if (_registeredUsers.any((u) => u.username == user.username)) {
//       return false; // User already exists
//     }
//     _registeredUsers.add(user);
//     print('User registered: ${user.username}');
//     return true;
//   }
// }

import 'package:mvc_flutter/models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final List<User> _registeredUsers = [];

  Future<bool> signup(User user) async {
    // Check if the user already exists
    if (_registeredUsers.any((u) => u.username == user.username)) {
      return false;
    }
    _registeredUsers.add(user);
    print('Registered users: $_registeredUsers');
    return true;
  }

  Future<bool> login(User user) async {
    return _registeredUsers.any((u) => u.username == user.username && u.password == user.password);
  }
}

