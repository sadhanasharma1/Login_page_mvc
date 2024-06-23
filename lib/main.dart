import 'package:flutter/material.dart';
import 'package:mvc_flutter/views/login_page.dart';
import 'package:mvc_flutter/views/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DPA'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Decimal Point Analytics'),
      ),
    );
  }
}
