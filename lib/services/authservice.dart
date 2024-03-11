// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:donor/error/errorhandling.dart';
import 'package:donor/global/global.dart';
import 'package:donor/global/snackdar.dart';
import 'package:donor/home/home.dart';
import 'package:donor/models/user.dart';
import 'package:donor/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpuser(
      {required BuildContext context,
      required String username,
      required String email,
      required password}) async {
    try {
      User user = User(
        id: '',
        username: username,
        password: password,
        email: email,
        token: '',
        type: '',
      );
      http.Response res = await http.post(
          Uri.parse(
            '$uri/api/signup',
          ),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            showSnackbar(context, 'account has been created');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void loginUser({
    required BuildContext context,
    required email,
    required password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);

            showSnackbar(context, 'login sucess');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void getUserdata(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      token ??= '';
      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'x-auth-token': token
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userData = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userData.body);
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
