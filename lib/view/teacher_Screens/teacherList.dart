import 'package:flutter/material.dart';

import '../../apiConfig/APIConfig.dart';


class teacherList extends StatefulWidget {
  const teacherList({Key? key}) : super(key: key);

  @override
  State<teacherList> createState() => _teacherListState();
}

class _teacherListState extends State<teacherList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Teacher List"),
      ),
      body: FutureBuilder(
        future: APIconfig.getTeacher(),
        builder: (context,snapshot)
        {
           if(snapshot.hasData & !snapshot.hasError)
             {
               var list = snapshot.data as List;
               return ListView.builder(
                   itemCount: list.length,
                   itemBuilder: (context,index)
                   {

                     return Card(
                       elevation: 20.0,
                       color: Colors.white,
                       margin: EdgeInsets.only(left: 10.0,right: 12.0,top: 30.0),
                       child: Container(
                         width: 200.0,
                         height: 200.0,
                         child: Column(
                           children: [

                             Row(
                               children: [
                                 SizedBox(width: 5.0,),
                                 Icon(Icons.person,size: 30.0,color: Colors.orange,),
                                 Text("Name :"+list[index]['name'],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                 SizedBox(width: 40.0),
                                 Image.asset("images/school.jpg",width: 80,height: 80,fit:BoxFit.cover,),
                               ],
                             ),
                             Row(
                               children: [
                                 SizedBox(width: 5.0,),
                                 Icon(Icons.person,size: 25.0,color: Colors.orange,),
                                 Text("Father Name :"+list[index]['father'],style: TextStyle(color: Colors.orange,fontSize: 17.0,fontWeight: FontWeight.bold,),),

                               ],
                             ),
                             SizedBox(height: 10.0,),
                             Row(
                               children: [
                                 SizedBox(width: 5.0,),
                                 Icon(Icons.local_post_office,size: 20.0,color: Colors.orange,),
                                 Text("Collification :"+list[index]['collification'],style: TextStyle(color: Colors.orange,fontSize: 17.0,fontWeight: FontWeight.bold),),
                               ],
                             ),
                             SizedBox(height: 10.0,),
                             Row(
                               children: [
                                 SizedBox(width: 5.0,),
                                 Icon(Icons.home,size: 25.0,color: Colors.orange,),
                                 Text("Address :"+list[index]['present'],style: TextStyle(color: Colors.orange,fontSize: 12.0,fontWeight: FontWeight.bold,),),
                                 SizedBox(width: 5.0,),
                                 Icon(Icons.phone,size: 20.0,color: Colors.orange,),
                                 Text("Contact :"+list[index]['contact'],style: TextStyle(color: Colors.orange,fontSize: 12.0,fontWeight: FontWeight.bold),)
                               ],
                             ),
                             SizedBox(height: 13.0,),
                           ],
                         ),
                       ),
                     );
                   }
               );
             }
           else
             {
                return Center(
                 child: CircularProgressIndicator(),
                );
             }
        },
      ),
    );
  }

  commonAppBar({required BuildContext screenContext, required Color shadowColor, required bool profilePic}) {}
}
