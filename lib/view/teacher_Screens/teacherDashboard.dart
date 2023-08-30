import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management_system/view/teacher_Screens/teacherList.dart';
import 'addTeacher.dart';



class teacherDashboard extends StatelessWidget {
  // const teacher({Key? key}) : super(key: key);
  var iconDashboard = [Icons.add,Icons.show_chart,Icons.delete,Icons.exit_to_app];
  var nameDashbaord = ["Add","Show","Delete","Exit"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.orange,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Teacher Dashboard",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0,left: 30.0,bottom: 20.0,right: 30.0),
        child: GridView.builder(
          itemCount: iconDashboard.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0
            ),
            itemBuilder: (context,index) {
              return Container(
                child: InkWell(
                  onTap: (){
                    if(index == 0)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>teachers()));
                      }
                    else if(index == 1)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherList()));
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
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Icon(iconDashboard[index],size: 50,color: Colors.blue,),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Center(child: Text(nameDashbaord[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
      ),
    );
  }
}
