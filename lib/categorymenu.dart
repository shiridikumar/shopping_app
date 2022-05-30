import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/vendorhome.dart';
import 'package:first/additem.dart';
import 'package:firebase_auth/firebase_auth.dart';

class category_menu extends StatefulWidget {
  const category_menu({Key? key}) : super(key: key);

  @override
  State<category_menu> createState() => _category_menuState();
}

class _category_menuState extends State<category_menu> {
  int fetched = 0;
  String category = "";
  Widget menulist = Container();
  List<dynamic> menu = [];
  CollectionReference ref = FirebaseFirestore.instance.collection("products");

  Widget getcard(item) {
    print(item);
    return Container(
        child: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/shopnow-db03c.appspot.com/o/images%2FZG0xZQMVw7t4FPmyBqVW?alt=media&token=65c964ee-4c47-4e3d-b310-0c8949df35d0"));
  }

  Widget filters(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[700]),
      height: 50.0,
    );
  }

  Widget menugrid(BuildContext context) {
    return Container(
      child: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(2),
            sliver: SliverGrid.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
                children: this.menu.map((item) {
                  return getcard(item);
                }).toList()),
          ),
        ],
      ),
    );
  }

  void fetchmenu(BuildContext context) async {
    dynamic arguments = await ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{} as Map;
    this.category = arguments["category"]!;
    // print(this.category);
    // print(arguments);
    dynamic data;
    await ref.where("Category", isEqualTo: "Mobiles").get().then((value) {
      data = value.docs.map((data) => print(data.data())).toList();
      if (this.fetched == 0) {
        setState(() {
          this.menu = data;
          this.menulist = menugrid(context);
          this.fetched = 1;
        });
      }
    });

    // data.docs.map((doc) => print("******"));
    // print(this.menu.length);
  }

  @override
  Widget build(BuildContext context) {
    fetchmenu(context);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            title: Text('shopNow',
                style: TextStyle(
                    fontFamily: "headfont", fontWeight: FontWeight.bold)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Icon(Icons.notifications),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              )
            ],
            // centerTitle: true,
            backgroundColor: Colors.grey[700]),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[filters(context), menulist],
        )));
  }
}
