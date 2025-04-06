import 'package:flutter/material.dart';
import 'package:youtube_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:youtube_app/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const AuthField(hintText: 'Name'),
            const SizedBox(height: 30),
            const AuthField(hintText: 'Email'),
            const SizedBox(height: 30),
            const AuthField(hintText: 'Password'),
            const SizedBox(height: 30),
            AuthGradientButton(buttonText: 'Sign Up', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
