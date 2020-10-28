import 'package:flutter/material.dart';

class RegisterSettings extends ChangeNotifier {
  bool _registerButtonActivity = false;

  //String _email = '';
  // String _username = '';
  // String _password = '';
  // String _passwordII = '';

  // bool checkLength(id, pw, pw2, email) {
  //   _username = id;
  //   _password = pw;
  //   _passwordII = pw2;
  //   _email = email;

  //   notifyListeners();
  // }

  void toggleRegisterButton() {
    _registerButtonActivity = !_registerButtonActivity;
    notifyListeners();
  }
}
