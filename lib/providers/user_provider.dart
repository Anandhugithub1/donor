import 'package:flutter/material.dart';
import 'package:donor/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user =
      User(id: '', username: '', email: '', password: '', token: '', type: '');
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void clearUser() {
    _user = User(
        id: '', username: '', email: '', password: '', token: '', type: '');
    notifyListeners();
  }
}
