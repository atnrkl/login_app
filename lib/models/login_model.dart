import 'package:flutter/material.dart';

class LoginFormModel extends ChangeNotifier {
  final _username = 'amedeus';
  final _password = '123';
  final _email = 'arboks123@hotmail.com';
  bool _pwSuffix = true;

  get getStringLength {}

  Map loginInfo(id, pw, email) {
    return {'id': id, 'pw': pw, 'email': email};
  }

  get getLogin {
    return loginInfo(_username, _password, _email);
  }

  void toggleSuffix() {
    _pwSuffix = !_pwSuffix;
    notifyListeners();
  }

  get getPwSuffix {
    return _pwSuffix;
  }

  // String newRegister(id, email, pw) {}
}
