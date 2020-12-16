import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get getUser => this._user;
  bool get existsUser => this._user != null ? true : false;

  set setUser(User user) {
    this._user = user;
    notifyListeners();
  }

  void setAge(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void removeUser() {
    this._user = null;
    notifyListeners();
  }

  void addProfs() {
    this._user.profs.add('${this._user.profs.length + 1}');
    notifyListeners();
  }
}
