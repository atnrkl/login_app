import 'package:flutter/material.dart';
import 'package:login_app/models/login_model.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/register_screen.dart';
import 'package:login_app/screens/sign_in_screen.dart';
import 'package:login_app/screens/splash_screen.dart';
import 'package:login_app/screens/test_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginFormModel(),
        )
      ],
      child: MaterialApp(
        theme: lightTheme,
        initialRoute: '/',
        routes: {
          '/test': (context) => TestScreen(),
          '/': (context) => HomeScreen(),
          '/splash': (context) => SplashScreen(),
          '/login': (context) => SignInScreen(),
          '/register': (context) => RegisterScreen()
        },
        // DISMISS KEYBOARD
        // FocusScope.of(context).requestFocus(new FocusNode());
      ),
    );
  }
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    primaryColor: Color(0xff1B63F2),
    primaryColorBrightness: Brightness.light,
    // primaryColorLight: Color(0xFF35328C),
    //primaryColorDark: Color(0xff222059),
    canvasColor: Color(0xFFF2F2F2),
    accentColor: Colors.grey.shade900,
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xffE0EAE6),
    bottomAppBarColor: Color(0xffF26C66),
    cardColor: Color(0xFF5386A6),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Colors.amber);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1a5D4524),
        100: Color(0xa15D4524),
        200: Color(0xaa5D4524),
        300: Color(0xaf5D4524),
        400: Color(0x1a483112),
        500: Color(0xa1483112),
        600: Color(0xaa483112),
        700: Color(0xff483112),
        800: Color(0xaf2F1E06),
        900: Color(0xff2F1E06)
      },
    ),
    primaryColor: Color(0xff5D4524),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0x1a311F06),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaa311F06),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1a311F06));
