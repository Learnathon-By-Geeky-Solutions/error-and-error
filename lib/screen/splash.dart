import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundStyle(),
          ),
          Padding(
              padding: EdgeInsets.only(left: 30,top: 70),
              child: Text("It's a\n New Beginning",style: headerText(),),
          ),
          Center(child: Icon(Icons.flutter_dash,size: 150,color: Colors.black54,)),
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 300),
                child:Container(
                width: 300,
                child: TextButton(onPressed: (){
                  Navigator.pushNamed(context, "/login");
              }, child: SuccessButtonChild("Let's Start")),
            )
            )
          )
        ],
      ),
    );
  }
}
