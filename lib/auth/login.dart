import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:donor/auth/signup.dart';
import 'package:donor/common/custom_button.dart';
import 'package:donor/common/custom_textfield.dart';
import 'package:donor/global/global.dart';
import 'package:donor/services/authservice.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser() {
    authService.loginUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _loginKey,
          child: Container(
            decoration: BoxDecoration(gradient: GlobalVaraibles.globalGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Lottie.network(
                    'https://lottie.host/c5be3b11-3072-4368-a2fd-0dd7b0e46d65/9GkeHQKEE1.json',
                    width: 200,
                    height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomTextfield(
                      controller: _emailController,
                      hintText: 'enter your email'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextfield(
                      controller: _passwordController,
                      hintText: 'enter your password'),
                ),
                CustomButtom(
                  onclick: () {
                    if (_loginKey.currentState != null &&
                        _loginKey.currentState!.validate()) {
                      loginUser();
                    }
                  },
                  text: 'Login',
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                    child: Text(
                      'new user? Register now',
                      style: TextStyle(color: GlobalVaraibles.blueColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
