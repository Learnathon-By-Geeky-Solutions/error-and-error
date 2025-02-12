import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stitch_hub/screen/loginScreen.dart';
import 'package:stitch_hub/screen/registrationScreen.dart';
import 'package:stitch_hub/screen/slashScreen.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      initialRoute: "/",
      routes: {
        "/":(context)=>splashScreen(),
        "/login":(context)=>LoginScreen(),
        "/registration":(context)=>RegistrationScreen(),
      },
    );
  }
}
