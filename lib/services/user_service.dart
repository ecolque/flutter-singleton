import 'dart:async';

import 'package:states/models/user.dart';

class _UserService {
  User _user;

  StreamController<User> _userStreamController =
      new StreamController<User>.broadcast();

  User get user => this._user;
  bool get existtUser => (this._user != null) ? true : false;
  Stream<User> get userStream => _userStreamController.stream;

  void chargeUser(User user) {
    this._user = user;
    this._userStreamController.add(user);
  }

  void changeAge(int edad) {
    this._user.age = edad;
    this._userStreamController.add(this._user);
  }

  dispose() {
    this._userStreamController?.close();
  }
}

final userService = new _UserService();
