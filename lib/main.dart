import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const Color backGroundColor = Color.fromARGB(255, 35, 35, 35);
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const Color primaryColor = Color.fromARGB(255, 115, 177, 133);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Login(),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.grey,
        primaryColor: const Color.fromARGB(255, 241, 233, 218),
        fontFamily: 'Arial',
        scaffoldBackgroundColor: backGroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: backGroundColor),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith(
                    (states) => primaryColor)),
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: primaryColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor,
          selectionHandleColor: primaryColor,
        ),
      ),
      routes: {
        '/login': (context) => Login()
      },
    ),
  );
}
