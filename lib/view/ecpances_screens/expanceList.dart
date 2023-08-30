import 'package:flutter/material.dart';

import '../../apiConfig/APIConfig.dart';


class expanceList extends StatefulWidget {
  const expanceList({Key? key}) : super(key: key);

  @override
  State<expanceList> createState() => _expanceListState();
}

class _expanceListState extends State<expanceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Expances",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
          future: APIconfig.getExpance(),
          builder: (context,snapshot)
          {
               if(snapshot.hasData && !snapshot.hasError)
                 {
                   var list = snapshot.data as List;
                   return ListView.builder(
                     itemCount: list.length,
                       itemBuilder:(context,index)
                       {

                         return Container(
                           child: Card(
                             elevation: 10.0,
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(40.0)
                             ),
                             child: Column(
                               children: [
                                 SizedBox(height: 12.0,),
                                 ListTile(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(50.0),
                                   ),
                                   title: Text("Expancer : ",style: TextStyle(color: Colors.orange,fontSize: 16.0),),
                                  // tileColor: Colors.orange,
                                   leading: Icon(Icons.person,color: Colors.orange,size: 40.0,),
                                   subtitle: Text(list[index]['expancer_name'].toString(),style: TextStyle(color: Colors.orange,fontSize: 20.0),),
                                 ),
                                 ListTile(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(50.0),
                                   ),
                                   title: Text("Description : ",style: TextStyle(color: Colors.orange,fontSize: 16.0),),
                                  // tileColor: Colors.orange,
                                   leading: Icon(Icons.description,color: Colors.orange,size: 40.0,),
                                   subtitle: Text(list[index]['description'].toString(),style: TextStyle(color: Colors.orange,fontSize: 20.0),),
                                 ),
                                 ListTile(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(50.0),
                                   ),
                                   title: Text("Amount : ",style: TextStyle(color: Colors.orange,fontSize: 16.0),),
                                 //  tileColor: Colors.orange,
                                   leading: Icon(Icons.price_check,color: Colors.orange,size: 40.0,),
                                   subtitle: Text(list[index]['amount'].toString(),style: TextStyle(color: Colors.orange,fontSize: 20.0),),
                                 ),
                                 ListTile(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(50.0),
                                   ),
                                   title: Text("Date : ",style: TextStyle(color: Colors.orange,fontSize: 16.0),),
                                  // tileColor: Colors.orange,
                                   leading: Icon(Icons.date_range_outlined,color: Colors.orange,size: 40.0,),
                                   subtitle: Text(list[index]['date1'].toString(),style: TextStyle(color: Colors.orange,fontSize: 20.0),),
                                 ),
                                 SizedBox(height: 12,),
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
        )
      ),
    );
  }
}
