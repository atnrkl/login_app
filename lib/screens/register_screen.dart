import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_app/models/login_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: BodyContainer());
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          TopBlue(),
          Positioned(
            // top: MediaQuery.of(context).size.height * 0.15,
            // left: MediaQuery.of(context).size.width * 0.14,
            child: Center(child: RegisterForm()),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _password = '';
    String _username = '';
    String _email = '';
    String _passwordII = '';

    Map loginInfo = Provider.of<LoginFormModel>(context).getLogin;

    Widget continueButton = FlatButton(
      child: Text("Tekrar dene"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog loginFailed = AlertDialog(
      title: Text("Giriş yapılamadı"),
      content: Text("Kullanıcı adı veya şifrenizi yanlış girdiniz"),
      actions: [continueButton],
    );

    AlertDialog registerFailed = AlertDialog(
      title: Text("Kayıt olunamadı"),
      content: Text("Tüm boşlukları doldurduğunuzdan emin olunuz"),
      actions: [continueButton],
    );

    bool validatePassword(pw1, pw2) {
      if (pw1 == pw2)
        return true;
      else
        return false;
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
                print(_username);
              },
              decoration: InputDecoration(
                labelText: 'Kullanıcı adı',
                hintText: 'Kullanıcı adı',
                prefixIcon: Icon(Icons.account_circle),
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
            TextField(
              onChanged: (value) {
                _email = value;
                print(_email);
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email adresi ',
                prefixIcon: Icon(Icons.alternate_email),
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
            TextField(
              onChanged: (value) {
                _password = value;
                print(_password);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                prefixIcon: Icon(Icons.lock),
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
            TextField(
              onChanged: (value) {
                _passwordII = value;
                print(_passwordII);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre tekrar',
                prefixIcon: Icon(Icons.lock),
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
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return registerFailed;
                //     },
                //   );
                // } else if (validatePassword(_password, _passwordII) == true) {
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return loginFailed;
                //     },
                //   );
                // } else {}

                // validateForms()
                //     ? print('logged in')
                //     : showDialog(
                //         context: context,
                //         builder: (context) {
                //           return registerFailed;
                //         },
                //       );

                // if (validatePassword(_password, _passwordII))
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return loginFailed;
                //     },
                //   );
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
                'Kayıt ol',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: Text(
                'Zaten üye misin ?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SignInButton(Buttons.Google, onPressed: () {}),
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
      alignment: Alignment.topCenter,
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          'Baggage Shop',
          style: TextStyle(
              fontSize: 42, fontFamily: 'Lobster', color: Colors.white),
        ),
      ),
    );
  }
}

//----------------------FUNCTİONS----------------------------

bool loginControl(username, password, loginInfo) {
  return (username == loginInfo['id'] ||
          username == loginInfo['email'] && password == loginInfo['pw']
      ? true
      : false);
}

//------------------------------------REGİSTER BUTTON STATE--------------
