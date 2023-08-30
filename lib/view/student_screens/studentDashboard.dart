import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management_system/view/student_screens/studentList.dart';

import 'addStudent.dart';


class studentDashboard extends StatefulWidget {
  @override
  State<studentDashboard> createState() => _studentDashboardState();
}

class _studentDashboardState extends State<studentDashboard> {
  var studentIcon = [Icons.add,Icons.show_chart,Icons.delete,Icons.exit_to_app];
  var studentName = ["Add","Show","Delete","Exit"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.orange,
        toolbarHeight: 50.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Student Dashboard",style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 40.0,top: 20.0),
        child: GridView.builder(
          itemCount: studentIcon.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
            ),
            itemBuilder: (context,index)
        {
          return Container(
               child: InkWell(
                 onTap: ()
                 {
                   if(index == 0)
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>addStudent()));
                     }
                   else if(index == 1)
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>studentList()));
                     }
                   else if(index == 2)
                     {

                     }
                     else
                       {
                         SystemNavigator.pop();
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
                       Center(child: Icon(studentIcon[index],size: 50.0,color: Colors.blue,),),
                       SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                       Center(child: Text(studentName[index],style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0)),),
                     ],
                   ),
                 ),
               ),
          );
        }),
      ),
    );
  }
}
