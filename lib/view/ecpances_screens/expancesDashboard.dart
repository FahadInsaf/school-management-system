import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'addExpance.dart';
import 'expanceList.dart';


class expances extends StatefulWidget {
  const expances({Key? key}) : super(key: key);

  @override
  State<expances> createState() => _expancesState();
}

class _expancesState extends State<expances> {
  @override
  Widget build(BuildContext context) {
    var expanceIcon  = [Icons.add,Icons.show_chart,Icons.exit_to_app];
    var expanceText = ["Add","Show","Exit"];
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        toolbarHeight: 50.0,
        backgroundColor: Colors.orange,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Expances Dashboard",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60.0,bottom: 20.0,left: 30.0,right: 30.0),
        child: GridView.builder(
          itemCount: expanceIcon.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
        ),
            itemBuilder: (context,index)
        {
          return Container(
             child: InkWell(
               onTap: ()
               {
                 if(index == 0)
                   {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>addexpance()));
                   }
                 else if(index == 1)
                   {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>expanceList()));
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
                     Center(child: Icon(expanceIcon[index],size: 50.0,color: Colors.blue,),),
                     SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                     Center(child: Text(expanceText[index],style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),)
                   ],
                 ),
               ),
             ),
           );
        }

        ),
      ),
    );
  }
}
