import 'package:flutter/material.dart';
import 'package:unnamed_app2/pages/Home_page.dart';
import 'package:unnamed_app2/pages/login.dart';
import 'package:unnamed_app2/splash.dart';
import 'package:unnamed_app2/theme/theme.dart';
void main(){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Home(),

      theme:lightmode,
      darkTheme:darkmode,


    );
  }
}
