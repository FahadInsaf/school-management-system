import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../onBoarding_Screen/onboarding.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage(),
            )

        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Rise And Shine Elementry School Amangarh Nowshera",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange)),
                SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                Lottie.asset("images/searchAnimation.json",width: 250.0,height: 250.0),
              ],
            ),
          ),
        ),



      ),
    );
  }
}
