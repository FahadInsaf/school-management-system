import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;

import '../login/login.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();

}
class _registerState extends State<register> {
 bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = ProgressDialog(context, title: Text("Registration..."), message: Text("please wait..."));
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22.0),bottomRight: Radius.circular(22.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register New Account",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("WellCome",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                ],
              ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: "User Name",
                                  prefixIcon: Icon(Icons.home),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                            )
                          ],
                        ),

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Email Address",
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                            )
                          ],
                        ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState((){
                                        _obscureText = !_obscureText;
                                      },
                                      );
                                    },
                                    child: Icon(_obscureText?Icons.visibility : Icons.visibility_off),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                            )
                          ],
                        ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "Contact No",
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                            )
                          ],
                        ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                  hintText: "Address",
                                  prefixIcon: Icon(Icons.home),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                            )
                          ],
                        ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                        ),
                        onPressed: () async {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

                        },
                        child: Text("Register",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
           Column(
             children: [
               Text("Terms & Condition here ,Read Carefully"),
               SizedBox(height: MediaQuery.of(context).size.height*0.01,),
               InkWell(
                 onTap: ()
                   {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
                   },
                   child: Text("Already Account",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
             ],
           )
          ],
        ),
      ),
    );
  }
}
