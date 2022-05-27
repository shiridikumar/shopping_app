import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/vendorhome.dart';
import 'package:first/additem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/home": (context) => Home(),
      "/vendorhome": (context) => VendorHome(),
      "/additem": (context) => additem()
    },
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

enum logintype { user, vendor }

class _LoginState extends State<Login> {
  int counter = 0;
  String tex = "hello";
  String password = "";
  logintype? type = logintype.user;
  CollectionReference ref = FirebaseFirestore.instance.collection("users");
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     // image: AssetImage("assets/bg.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey[200],
                body: Center(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
                      child: Text("shopNow",
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "headfont")),
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter your username',
                        ),
                        onChanged: (text) {
                          setState(() {
                            tex = text;
                          });
                        },
                        style: TextStyle(
                            color: Colors.black,
                            decorationStyle: TextDecorationStyle.dotted,
                            decorationColor: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter password',
                        ),
                        onChanged: (text) {
                          setState(() {
                            password = text;
                          });
                        },
                        style: TextStyle(
                            color: Colors.black,
                            decorationStyle: TextDecorationStyle.dotted,
                            decorationColor: Colors.white),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                          minWidth: 350.0, maxWidth: 350.0, minHeight: 30.0),
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Material(
                        color: Colors.blue,
                        child: InkWell(
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text("Login",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          onTap: () {
                            // ref.add({"name": tex});
                            // print(tex);
                            if (type == logintype.user) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', (route) => false);
                            } else {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/vendorhome', (route) => false);
                            }
                          },
                          // color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 10.0,
                        maxWidth: double.infinity,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: 150.0, maxHeight: 100.0),
                            child: ListTile(
                              title: Text('User'),
                              leading: Radio(
                                value: logintype.user,
                                groupValue: type,
                                onChanged: (logintype? value) {
                                  setState(() {
                                    type = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: 150.0, maxHeight: 100.0),
                            child: ListTile(
                              title: const Text('Vendor'),
                              leading: Radio(
                                value: logintype.vendor,
                                groupValue: type,
                                onChanged: (logintype? value) {
                                  setState(() {
                                    type = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ))));
  }
}
