import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_skip_app/home_screen.dart';
import 'package:login_skip_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String LOGINKEY = "login";

  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Welcome User",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          )
        ],
      ),
    ));
  }

  Future<void> whereToGo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool(LOGINKEY);

    Timer(
      Duration(seconds: 2),
      () {
        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      },
    );
  }
}
