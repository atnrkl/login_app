import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_app/models/login_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              TopBlue(),
              Positioned(
                //bottom: MediaQuery.of(context).size.height * 0.17,
                // left: MediaQuery.of(context).size.width * 0.35,
                child: Center(child: LoginForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _password = '';
    String _username = '';
    Map loginInfo = Provider.of<LoginFormModel>(context).getLogin;
    bool suffixState = Provider.of<LoginFormModel>(context).getPwSuffix;

    //print(suffixState);

    Widget continueButton = FlatButton(
      child: Text("Tekrar dene"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Giriş yapılamadı"),
      content: Text("Kullanıcı adı veya şifrenizi yanlış girdiniz"),
      actions: [continueButton],
    );

    Icon suffixIcon() {
      return suffixState ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    }

    void toggleSuffixState() {
      Provider.of<LoginFormModel>(context, listen: false).toggleSuffix();
    }

    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _username = value;
              },
              decoration: InputDecoration(
                labelText: 'Kullanıcı adı',
                counterText: '',
                hintText: 'Kullanıcı adı veya e-mail adresi',
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              maxLength: 32,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                _password = value;
              },
              maxLength: 32,
              obscureText: suffixState,
              decoration: InputDecoration(
                counterText: '',
                labelText: 'Şifre',
                hintText: 'Şifre',
                prefixIcon: Icon(
                  Icons.lock,
                  size: 20,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: suffixIcon(),
                    highlightColor: Colors.grey,
                    onPressed: () {
                      toggleSuffixState();
                    },
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blue.shade600,
              onPressed: () {
                loginControl(_username.trim(), _password, loginInfo)
                    ? print('logged in')
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return alert;
                        },
                      );
                // : AlertDialog(
                //     title: Text('Giriş yapılamadı'),
                //     content: Text('kullanıcı adı ve şifrenizi kontol edin'),
                //     actions: [
                //       FlatButton(
                //         child: Text('tekrar dene'),
                //         onPressed: () {},
                //       )
                //     ],
                //   );
              },
              child: Text(
                'Giriş yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Şifreni mi unuttun ?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SignInButton(Buttons.Google, onPressed: () {}),
            SizedBox(
              height: 10,
            ),
            Text(
              'YA DA',
              style: TextStyle(color: Colors.grey.shade500),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'KAYIT OL',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBlue extends StatelessWidget {
  const TopBlue({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: Colors.blue.shade600,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(100, 40),
            bottomRight: Radius.elliptical(100, 40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(0, 3),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ]),
      child: Text(
        'Baggage Shop',
        style:
            TextStyle(fontSize: 42, fontFamily: 'Lobster', color: Colors.white),
      ),
    );
  }
}

//------------------------FUNCTİONS----------------------------

bool loginControl(username, password, loginInfo) {
  print(loginInfo['id']);
  print(loginInfo['pw']);
  print(password);
  print(username);

  return ((username == loginInfo['id'] || username == loginInfo['email']) &&
          password == loginInfo['pw']
      ? true
      : false);
}
