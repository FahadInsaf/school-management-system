import 'package:flutter/material.dart';
import 'package:school_management_system/view/student_screens/studentDashboard.dart';
import 'package:school_management_system/view/teacher_Screens/teacherDashboard.dart';

import '../navigation__Drawer/drawer.dart';
import 'class_screen/classDashboard.dart';
import 'ecpances_screens/expancesDashboard.dart';


class dashboard extends StatelessWidget {
  // const dashboard({Key? key}) : super(key: key);
  var dashboardImages = [
    "images/teache.png",
    "images/students.png",
    "images/class.png",
    "images/pay-fee.png",
    "images/admission.png",
    "images/expance.png"
  ];
  var dashboardName  = ["Teacher","Student","Class","Fee","admission","expances"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.orange,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Dashboard",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 40.0,top: 20.0),
        child: GridView.builder(
          itemCount: dashboardName.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0
            ),
            itemBuilder: (context,index)
            {
              return Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    height: MediaQuery.of(context).size.height*0.4,
                    child: InkWell(
                      onTap: (){
                        if(index == 0)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherDashboard()));
                          }
                        else if(index == 1)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>studentDashboard()));
                          }
                        else if(index == 2)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>classDashboard()));
                          }
                        else if(index == 3)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                          }
                        else if(index == 4)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                          }
                        else if(index == 5)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>expances()));
                          }
                      },
                      child: Card(
                        elevation: 35.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Image.asset(dashboardImages[index],width: 70.0,height: 70.0,),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            Center(child: Text(dashboardName[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),)
                          ],
                        ),
                      ),
                    ),
              );
            }
        ),
      ),
      drawer:MyDrawer(),
    );
  }
}
