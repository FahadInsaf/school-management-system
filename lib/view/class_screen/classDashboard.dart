import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addClass.dart';


class classDashboard extends StatefulWidget {

  @override
  State<classDashboard> createState() => _classDashboardState();
}

class _classDashboardState extends State<classDashboard> {
  @override
  var cIcon = [Icons.add,Icons.show_chart,Icons.delete,Icons.exit_to_app];
  var cName = ["Add","Show","Delete","Exit"];
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 35.0,
        backgroundColor: Colors.orange,
        toolbarHeight: 60.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Class Dashboard",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 20.0,left: 30.0,bottom: 20.0,right: 30.0),
          child: GridView.builder(
                 itemCount: cIcon.length,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      }
                      else if(index == 1)
                      {

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
                          Center(child: Icon(cIcon[index],size: 50,color: Colors.blue,),),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Center(child: Text(cName[index],style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),),
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
