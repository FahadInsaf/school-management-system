import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'classDashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Initial Selected Value
  String dropdownvalue = 'Class One ( 1 )';

  // List of items in our dropdown menu
  var items = [
    'Class One ( 1 )',
    'Class Two ( 2 )',
    'Class Three ( 3 )',
    'Class Four ( 4 )',
    'Class Five ( 5 )',
    'Class Six ( 6 )',
    "Class Seven ( 7 )",
    "Class Eight ( 8 )",
    "Class Nine ( 9 )",
    "Class Ten ( 10 )"
  ];
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context, title: Text("Add Class"), message: Text("Please wait..."));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("Add New Class",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
      body: Container(
        width: 600.0,
        height: 350.0,
        child: Card(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
             elevation: 10.0,
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        )
                      ),
                     // Initial Value
                     value: dropdownvalue,
                     // Down Arrow Icon
                     icon: const Icon(Icons.keyboard_arrow_down),
                     // Array list of items
                     items: items.map((String items) {

                       return DropdownMenuItem(
                         value: items,
                         child: Text(items),

                       );
                     }).toList(),

                     // After selecting the desired option,it will
                     // change button value to selected value
                     onChanged: (String? newValue) {
                       setState(() {
                         dropdownvalue = newValue!;

                       });
                     },
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text("Description"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                      ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.orange,
                           textStyle: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 15.0,
                           ),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30.0),
                           )
                       ),
                       onPressed: ()async{
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>classDashboard()));
                       },
                       child: Text("Add Class"))
                 ],
               ),
             ),
        ),
      ),
    );
  }
}