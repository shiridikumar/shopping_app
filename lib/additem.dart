import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/vendorhome.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';
// import 'package:firebase_core_web/firebase_core_web.dart';
// import 'package:sto'

class additem extends StatefulWidget {
  const additem({Key? key}) : super(key: key);

  @override
  State<additem> createState() => _additemState();
}

class _additemState extends State<additem> {
  FirebaseStorage storage = FirebaseStorage.instance;

  List<Widget> specs = [];
  List<String> types = [];
  String cate = "";
  Map<String, List<String>> categories = {
    "Electronics": [
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
    ],
    "Fashion": [
      "Shoes",
      "Shirts",
      "Pants",
      "Trousers",
      "Saree",
      "Socks",
      "Sandals",
      "Slippers",
      "Suit",
      "Other"
    ],
    "Laptops": ["Laptops", "PC"],
    "Mobiles": ["Mobiles", "Tablets", "Ipad"],
    "Stationery": ["Books", "Pens", "Novels", "Other"],
    "Home": [
      "Sofa",
      "Matrice",
      "Cort",
      "Tables",
      "Chairs",
      "Dining table",
      "Blankets",
      "Pillows",
      "Bed sheets",
      "Bags",
      "Utensils",
      "Trolley",
      "Bottles",
      "Plates",
      "Dining set"
    ]
  };
  CollectionReference ref = FirebaseFirestore.instance.collection("products");
  dynamic imagevalue;
  List<Widget> specsupd = [];
  List<String> value_indices = ['', 'Product Type', '', ''];
  Widget setpic = Image.asset(
    'assets/no-image.jpg',
    height: 250.0,
  );
  int index = 3;
  void addfields() {
    value_indices.add('');
    value_indices.add('');
    List<Widget> myArray = [
      gen_textfield(
          this.index + 1, 'Enter Field name', 'Field name', 250, 0, 0),
      gen_textfield(
          this.index + 2, 'Enter Field value', 'Field value', 250, 0, 0)
    ];
    this.index += 2;
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
      int ind, String hint, String label, double width, int height, int type) {
    return Container(
      padding: EdgeInsets.all(5.0),
      constraints: BoxConstraints(maxWidth: width),
      child: TextFormField(
        keyboardType: (type == 1) ? TextInputType.number : TextInputType.text,
        // obscureText: true,
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
        onChanged: (text) {
          this.value_indices[ind] = text;
        },
        style: TextStyle(
            color: Colors.black,
            // decorationStyle: TextDecorationStyle.dotted,
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
                  gen_textfield(0, '', "Prodcut Name", 300, 0, 0),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      constraints: BoxConstraints(maxWidth: 300.0),
                      child: DropdownButton<String>(
                        hint: Text(this.value_indices[1]),
                        items: this.types.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          this.value_indices[1] = value.toString();
                          setState(() {
                            this.value_indices[1] = value.toString();
                          });
                        },
                      )),
                  gen_textfield(2, '', "MRP", 300, 0, 1),
                  gen_textfield(3, '', "Final Price", 300, 0, 1),
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
          setpic,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  uploadimage();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, minimumSize: Size(200.0, 50.0)),
                child: Text('Upload image', style: TextStyle(fontSize: 20.0))),
          )
        ]));
  }

  void uploadimage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        withData: true,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'svg', 'jpeg']);

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        this.imagevalue = file.bytes;
        this.setpic = Image.memory(
          this.imagevalue,
          height: 250.0,
        );
      });
    } else {
      // User canceled the picker

    }
  }

  void upload() async {
    // await FirebaseAuth.instance.signInAnonymously();
    Map<String, dynamic> details = {};
    Reference reference = storage.ref();
    details["product_name"] = this.value_indices[0];
    details["product_type"] = this.value_indices[1];
    details["mrp"] = this.value_indices[2];
    details["final_price"] = this.value_indices[3];
    for (int i = 4; i < this.value_indices.length; i += 2) {
      if (this.value_indices[i] != "" && this.value_indices[i + 1] != "") {
        details[this.value_indices[i]] = this.value_indices[i + 1];
      }
    }

    details["Category"] = this.cate;
    DocumentReference docid = await ref.add(details);
    UploadTask uploadTask =
        reference.child("images/" + docid.id + "/").putData(this.imagevalue);
    await uploadTask.whenComplete(() async {
      String url =
          await reference.child("images/" + docid.id + "/").getDownloadURL();
      ref.doc(docid.id).update({"image_url": url});
      print(details);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    print(arguments);
    if (categories[arguments["category"]] != null) {
      print("helllllo");
      this.types = categories[arguments["category"]]!;
    }
    this.cate = arguments["category"];
    for (int i = 0; i < this.categories.length; i++) {}
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
                  onPressed: () {
                    print(this.value_indices);
                    upload();
                  },
                  child: Text("Add", style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800],
                      minimumSize: Size(300.0, 50.0))),
            )
          ],
        )));
  }
}
