import 'package:flutter/material.dart';
import 'dart:ui';

import '../view/class_screen/classDashboard.dart';
import '../view/dashboard.dart';
import '../view/ecpances_screens/expancesDashboard.dart';
import '../view/student_screens/studentDashboard.dart';
import '../view/teacher_Screens/teacherDashboard.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(250),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.7,
          child: Drawer(
            child: new ListView(
              children: <Widget>[
                Column(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.orange
                      ),
                      accountName: Text("Fahad Insaf",style: TextStyle(color: Colors.black),),
                      accountEmail: Text("fahadinsaf92@gmail.com",style: TextStyle(color: Colors.black)),

                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("images/fahad.pngflutt",width: 80,height: 80,),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/teache.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Teacher"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherDashboard()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/students.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Students"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>studentDashboard()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/class.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Classes"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>classDashboard()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/pay-fee.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Fee"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/admission.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Addmission"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>classDashboard()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/expance.png"), // No matter how big it is, it won't overflow
                  ),
                  title: Text("Expances"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>expances()));
                  },
                ),
                new Divider(
                  color: Colors.black,
                ),
                new ListTile(
                  title: new Text(
                    'Close Menu',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {

                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}