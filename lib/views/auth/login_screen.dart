import 'package:flutter/material.dart';
import 'package:neworkx/core/app_spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/neworkx_logo.png", height: 35, width: 175),
              SizedBox(height: 20), // Add spacing between logo and text fields
             
             Container(child: Text("data"),)
            ],
          ),
        ),
      ),
    );
  }
}
