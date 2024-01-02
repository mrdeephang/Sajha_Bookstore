import 'package:flutter/material.dart';
import 'package:sajhabackup/HomePage/homepage.dart';

class adddetails extends StatefulWidget {
  const adddetails({super.key});

  @override
  State<adddetails> createState() => _adddetailsState();
}

class _adddetailsState extends State<adddetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        backgroundColor: Color(0xFF9526BC),
        leading: BackButton(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homepage()));
            },
            child: Text(
              "Finish",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Add Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF9526BC)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Column(
                children: [
                  inputFile(label: "Book's Name"),
                  inputFile(label: "Author"),
                  inputFile(label: "Edition"),
                  inputFile(label: "Publisher"),
                  inputFile(label: "Condition"),
                  inputFile(label: "Price"),
                  inputFile(label: "Address"),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                child: Container(
                  color: Colors.grey[250],
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Additional Information",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            ))),
      ),
      SizedBox(height: 10)
    ],
  );
}
