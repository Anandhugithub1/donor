import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:donor/global/global.dart';
import 'package:donor/home/home.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:donor/routes/route.dart';
import 'package:donor/services/authservice.dart';
import 'package:donor/splashscreen/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserdata(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Home()
          : SplashScreen(),
      theme: ThemeData(
          textTheme: TextTheme(
              titleMedium: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: GlobalVaraibles.blueColor),
              titleLarge: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: GlobalVaraibles.blueColor),
              titleSmall:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          useMaterial3: true),
    );
  }
}
