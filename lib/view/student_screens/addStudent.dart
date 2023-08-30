import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart'as http;
import 'package:school_management_system/view/student_screens/studentDashboard.dart';


class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  TextEditingController dates = TextEditingController();

  void initState() {
    dates.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog =  ProgressDialog(context, title: Text("Student Adding"), message: Text("please wait"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 20.0,
        toolbarHeight: 40.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
                child: Text("Add New Student",style: TextStyle(color: Colors.black,fontSize: 23.0,fontWeight: FontWeight.bold),)
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
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
                     label: Text("Student Name"),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0),
                     )
                   ),
                ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text("Student Father Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text("Student Class"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Student Father Cnic No"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          label: Text("Student Present Address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          label: Text("Student Parmanent Address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          label: Text("Student Contact No"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    TextFormField(
                      controller: dates, //editing controller of this TextField
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                          prefixIcon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Select Date" //label text of field
                           
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
                            dates.text = formattedDate; //set output date to TextField value.
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
                        child: Text("Add Student",))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
