import 'package:flutter/material.dart';
import 'package:donor/auth/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _navigateToMainScreen();
    });
  }

  // Function to navigate to the main screen
  void _navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen()), // Change to your home screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 140,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
