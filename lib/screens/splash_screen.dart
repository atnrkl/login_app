import 'package:flutter/material.dart';
// import 'dart:math';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double y = MediaQuery.of(context).size.height;
    // double x = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 170,
                backgroundImage: AssetImage('assets/images/Gifts-rafiki.png'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  'Seyahatlerinden para kazanmak ister misin ? \nYurt dışından bir şeyelere mi ihtiyacın var ?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: RaisedButton(
                  child: Text('      Giriş Yap       '),
                  color: Colors.amber,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: RaisedButton(
                  child: Text('       Kayıt Ol       '),
                  color: Colors.amber,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
