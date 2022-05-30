import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/categorymenu.dart';
import 'package:flutter/material.dart';
import 'package:first/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/vendorhome.dart';
import 'package:first/additem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/categorymenu.dart';

class itemdetails extends StatefulWidget {
  const itemdetails({Key? key}) : super(key: key);

  @override
  State<itemdetails> createState() => _itemdetailsState();
}

class _itemdetailsState extends State<itemdetails> {
  Map<String, dynamic> item = {};
  Widget details(context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(30.0),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text("M.R.P",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  Text(" \u{20B9}${item['mrp']}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black))
                ],
              ),
            ),
            Container(
              // decoration: BoxDecoration(color: Colors.red[900]),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      "Deal Price: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\u{20B9}${item['final_price']}",
                      style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "You save: \u{20B9}${int.parse(item['mrp']) - int.parse(item['final_price'])}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ]),
        ),
        Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text(
                "About this item",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  "About this item hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                  style: TextStyle(fontSize: 20.0))
            ]))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{} as Map;
    this.item = arguments!;
    print(arguments);

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
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Text(arguments["product_name"],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    Image.network(arguments["image_url"]),
                  ]),
            ),
            details(context)
          ],
        )));
  }
}
