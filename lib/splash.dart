import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unnamed_app2/onboarding.dart';
import 'package:unnamed_app2/pages/login.dart';
class Splash extends StatefulWidget{

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  onboarding()
    )
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body:
      Padding(

        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
        Theme.of(context).brightness==Brightness.light? 'assets/logos/splash_image.png' : 'assets/logos/dark_splash_image.png',
            ),


          ],
        ),
      ),
    );
  }
}
