import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import '../../view/dashboard.dart';
import '../registeration/register.dart';



class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  bool _obsxureText = true;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dailog = new ProgressDialog(context, title: Text("School Login"), message: Text("please wait"));
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:300.0,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,color:Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("Hello There",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("WellCome Back",style: TextStyle(color: Colors.white,fontSize: 23.0,fontWeight: FontWeight.bold),),
                ],
              ),
            ) ,
            Container(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.home),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon:  Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState((){
                                  _obsxureText = !_obsxureText;
                                },
                                );
                              },
                              child: Icon(_obsxureText?Icons.visibility : Icons.visibility_off),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                        obscureText: _obsxureText,
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 18.0,right: 18.0),
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                          onPressed: ()async{

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>dashboard()));

                      },
                          child: Text("Login",)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                    ],


                  ),


                ),

              ),
            ),
            Column(
              children: [
                Text("Terms & Condition here, Read CareFully"),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                    },
                    child: Column(
                      children: [
                        Text("Don't have account",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],


        ),

      ),

    );
  }
}
