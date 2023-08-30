import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart'as http;
import 'package:school_management_system/view/teacher_Screens/teacherDashboard.dart';


class teachers extends StatefulWidget {
  const teachers({Key? key}) : super(key: key);

  @override
  State<teachers> createState() => _teachersState();
}

class _teachersState extends State<teachers> {

  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProgressDialog dailog = ProgressDialog(context, title: Text("Teacher Adding"), message: Text("please wait..."));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("Add New Teacher",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
     body: SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.all(10.0),
           child: Card(
             elevation: 15.0,
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 children: [
                   TextFormField(
                     keyboardType: TextInputType.name,
                     decoration: InputDecoration(
                       label: Text("Enter Teacher Name"),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                       )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.name,
                     decoration: InputDecoration(
                       label: Text("Enter Teacher Father Name"),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                       )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Enter Teacher Collification"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       label: Text("Enter Teachar Cnic No"),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                       )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       label: Text("Enter Teacher Present Address"),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                       )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                         label: Text("Enter Teacher Parmanent Address"),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20.0),
                         )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                         label: Text("Enter Teacher Contact No"),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20.0),
                         )
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   TextFormField(
                     controller: dateinput, //editing controller of this TextField
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0)
                       ),
                         prefixIcon: Icon(Icons.calendar_today), //icon of text field
                         labelText: "Select Joining Date" //label text of field
                     ),
                     readOnly: true,  //set it true, so that user will not able to edit text
                     onTap: () async {
                       DateTime ?pickedDate = await showDatePicker(
                           context: context, initialDate: DateTime.now(),
                           firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                           lastDate: DateTime(2101)
                       );

                       if(pickedDate != null ){
                         print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                         String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                         print(formattedDate); //formatted date output using intl package =>  2021-03-16
                         //you can implement different kind of Date Format here according to your requirement

                         setState(() {
                           dateinput.text = formattedDate; //set output date to TextField value.
                         });
                       }else{
                         print("Date is not selected");
                       }
                     },
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                       child: Text("Add Teacher"))
                 ],
               ),
             ),
           ),
         ),
     ),

    );
  }
}
