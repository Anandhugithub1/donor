import 'package:flutter/material.dart';
import 'package:donor/auth/login.dart';
import 'package:donor/common/custom_button.dart';
import 'package:donor/common/custom_textfield.dart';
import 'package:donor/global/global.dart';
import 'package:donor/services/authservice.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void signUpUser() {
    _authService.signUpuser(
      context: context,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _signUpFormKey,
          child: Container(
            decoration: BoxDecoration(gradient: GlobalVaraibles.globalGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text('Register', style: Theme.of(context).textTheme.titleLarge),
                Lottie.network(
                    'https://lottie.host/60b45398-1ed8-4e74-a6bc-2306fe5538fe/gfIU6Ek0n3.json',
                    width: 200,
                    height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomTextfield(
                    controller: _emailController,
                    hintText: 'Enter your email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextfield(
                    controller: _usernameController,
                    hintText: 'Enter your username',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextfield(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                  ),
                ),
                CustomButtom(
                  text: 'Signup',
                  onclick: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'already a user? login here',
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
