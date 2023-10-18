import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login ',
      home: LoginScreen(), // This sets the login screen as the initial screen
    );
  }
}
