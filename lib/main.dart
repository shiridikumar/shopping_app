import 'package:flutter/material.dart';
import 'package:first/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/home": (context) => Home(),
    },
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int counter = 0;
  String tex = "hello";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
                      child: Text("shopNow",
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "headfont")),
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0)),
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
                            color: Colors.blue,
                            decorationStyle: TextDecorationStyle.dotted,
                            decorationColor: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0)),
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
                            color: Colors.blue,
                            decorationStyle: TextDecorationStyle.dotted,
                            decorationColor: Colors.white),
                      ),
                    ),
                    Container(
                      constraints:
                          BoxConstraints(minWidth: 350.0, maxWidth: 350.0),
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: Colors.blue[200]),
                        child: Text("Login",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          print(tex);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (route) => false);
                        },
                        // color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Icon(Icons.shopping_cart,
                          color: Colors.blue, size: 150.0),
                    )
                  ]),
                ))));
  }
}
