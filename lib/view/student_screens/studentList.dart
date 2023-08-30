import 'package:flutter/material.dart';

import '../../apiConfig/APIConfig.dart';


class studentList extends StatefulWidget {
  const studentList({Key? key}) : super(key: key);

  @override
  State<studentList> createState() => _studentListState();
}

class _studentListState extends State<studentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Detail",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FutureBuilder(
            future: APIconfig.getStudent(),
            builder: (context,snapshot)
            {
              if(snapshot.hasData && !snapshot.hasError)
              {
                var list = snapshot.data as List;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder:(context,index)
                    {

                      return Card(
                        elevation: 20.0,

                        color: Colors.white,
                        margin: EdgeInsets.only(left: 10.0,right: 12.0,top: 30.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2.0,top: 7.0),
                          child: Container(

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 5.0,),
                                    Icon(Icons.person,size: 30.0,color: Colors.orange,),
                                    Text("Name :"+list[index]['name'],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 15.0),
                                    Image.asset("images/school.jpg",width: 80,height: 80,fit:BoxFit.cover,),
                                  ],
                                ),
                                SizedBox(height: 12.0,),
                                Row(
                                  children: [
                                    SizedBox(width: 5.0,),
                                    Icon(Icons.person,size: 25.0,color: Colors.orange,),
                                    Text("F/Name :"+list[index]['father'],style: TextStyle(color: Colors.orange,fontSize: 12.0,fontWeight: FontWeight.bold,),),
                                    SizedBox(width: 6.0,),
                                    Icon(Icons.class_,size: 20.0,color: Colors.orange,),
                                    Text("Class :"+list[index]['class1'],style: TextStyle(color: Colors.orange,fontSize: 14.0,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                Row(
                                  children: [
                                    SizedBox(width: 5.0,),
                                    Icon(Icons.home,size: 25.0,color: Colors.orange,),
                                    Text("Cnic :"+list[index]['cnic'],style: TextStyle(color: Colors.orange,fontSize: 12.0,fontWeight: FontWeight.bold,),),
                                    SizedBox(width: 10.0,),
                                    Icon(Icons.g_translate_outlined,size: 20.0,color: Colors.orange,),
                                    SizedBox(width: 5.0,),
                                    Text("Gender :"+list[index]['gender'],style: TextStyle(color: Colors.orange,fontSize: 12.0,fontWeight: FontWeight.bold),)
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
                                SizedBox(height: 10.0,),
                                Row(
                                  children: [
                                    SizedBox(width: 5.0,),
                                    Icon(Icons.date_range_outlined,size: 25.0,color: Colors.orange,),
                                    Text("Date Of Birth :"+list[index]['birth'],style: TextStyle(color: Colors.orange,fontSize: 12,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(height: 13.0,),
                              ],
                            ),
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
