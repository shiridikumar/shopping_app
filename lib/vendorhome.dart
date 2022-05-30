import 'package:first/main.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter/material.dart';
import 'package:first/additem.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({Key? key}) : super(key: key);

  @override
  State<VendorHome> createState() => _State();
}

class _State extends State<VendorHome> {
  List<String> categories = [
    "Electronics",
    "Fashion",
    "Laptops",
    "Mobiles",
    "Stationery",
    "Home",
  ];
  List<String> urls = [
    "electronics.jpeg",
    "fashion.jpg",
    "laptops.jpg",
    "mobiles.jpg",
    "books.jpeg",
    "home.jpeg"
  ];

  Widget getcard(item) {
    String name = this.categories[this.urls.indexOf(item)];
    return Container(
        width: 240.0,
        height: 300.0,
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(0.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size.zero, // Set this
              padding: EdgeInsets.zero, // and this
              primary: Colors.grey[400]),
          // style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
          onPressed: () {
            Navigator.pushNamed(context, '/additem',
                arguments: {"category": name});
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Image.asset("assets/" + item, fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    name,
                    style: TextStyle(fontFamily: "mainfont", fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget addcategories(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      constraints: BoxConstraints(maxHeight: double.infinity),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("Add items to your store",
              style: TextStyle(fontFamily: "mainfont", fontSize: 15.0)),
          CustomScrollView(
            primary: false,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(2),
                sliver: SliverGrid.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio: 200 / 210,
                    children: this.urls.map((item) {
                      return getcard(item);
                    }).toList()),
              ),
            ],
          ),
        ],
      ),
    );
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
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "shiridi kumar store",
                  style: TextStyle(fontFamily: "mainfont", fontSize: 30.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            addcategories(context)
          ],
        )));
  }
}
