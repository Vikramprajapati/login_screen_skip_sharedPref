import 'package:flutter/material.dart';
import 'package:login_skip_app/login_screen.dart';
import 'package:login_skip_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To Home Page",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            TextButton(onPressed: () async {

              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
              sharedPreferences.setBool(SplashScreenState.LOGINKEY, false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

            }, child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
