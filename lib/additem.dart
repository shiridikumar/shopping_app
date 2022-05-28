import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/vendorhome.dart';

class additem extends StatefulWidget {
  const additem({Key? key}) : super(key: key);

  @override
  State<additem> createState() => _additemState();
}

class _additemState extends State<additem> {
  List<Widget> specs = [];
  List<Widget> specsupd = [];
  List<String> value_indices = ['', '', '', ''];
  void addfields() {
    List<Widget> myArray = [
      gen_textfield(3, 'Enter Field name', 'Field name', 250, 0),
      gen_textfield(3, 'Enter Field value', 'Field value', 250, 0)
    ];
    this.specs.add(Container(
        constraints: BoxConstraints(maxHeight: 200.0),
        child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0.0),
            mainAxisSpacing: 1.0,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: 1.0,
            crossAxisCount: 2, // here you keep track of count
            children: myArray)));
    setState(() {
      this.specsupd = this.specs;
    });
  }

  Widget gen_textfield(
      int ind, String hint, String label, double width, int height) {
    return Container(
      padding: EdgeInsets.all(5.0),
      constraints: BoxConstraints(maxWidth: width),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.blue)),
            labelText: label,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey))),
        onChanged: (text) {},
        style: TextStyle(
            color: Colors.black,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: Colors.white),
      ),
    );
  }

  Widget uploaddetails(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        constraints: BoxConstraints(minWidth: 400.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Fill in the following details",
                      style: TextStyle(fontFamily: "mainfont", fontSize: 18.0)),
                  SizedBox(height: 20.0),
                  gen_textfield(0, '', "Prodcut Name", 300, 0),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      constraints: BoxConstraints(maxWidth: 300.0),
                      child: DropdownButton<String>(
                        hint: Text('Product Type'),
                        items: <String>[
                          'Watch',
                          'Camera',
                          'Telivision',
                          'Washing machine',
                          'PC',
                          'Fan',
                          'AC',
                          'Headset',
                          'TubeLight',
                          'Other'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )),
                  gen_textfield(1, '', "MRP", 300, 0),
                  gen_textfield(0, '', "Final Price", 300, 0),
                ]),
            Column(children: this.specsupd),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      addfields();
                    },
                    child: Text('Add fields'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, minimumSize: Size(100.0, 50.0))),
              ),
            ),
          ],
        ));
  }

  Widget uploadpic(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints(minWidth: 400.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/no-image.jpg',
            height: 250.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, minimumSize: Size(200.0, 50.0)),
                child: Text('Upload image', style: TextStyle(fontSize: 20.0))),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            title: Text('shopNow',
                style: TextStyle(
                    fontFamily: "headfont", fontWeight: FontWeight.bold)),
            // centerTitle: true,
            backgroundColor: Colors.grey[700]),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            uploadpic(context),
            SizedBox(height: 30.0),
            uploaddetails(context),
            Container(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add", style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800],
                      minimumSize: Size(300.0, 50.0))),
            )
          ],
        )));
  }
}
