import 'dart:ffi';

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
  Widget uploaddetails(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        constraints: BoxConstraints(minWidth: 400.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Fill in the following details",
                  style: TextStyle(fontFamily: "mainfont", fontSize: 18.0)),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(5.0),
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'Product name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey))),
                  onChanged: (text) {},
                  style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationColor: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'Product type',
                      hintText: 'Enter Product type , eg: Earphones...',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey))),
                  onChanged: (text) {},
                  style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationColor: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'MRP',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey))),
                  onChanged: (text) {},
                  style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationColor: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                constraints: BoxConstraints(maxWidth: 300.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'Final price',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey))),
                  onChanged: (text) {},
                  style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationColor: Colors.white),
                ),
              ),
            ]));
  }

  Widget uploadpic(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints(minWidth: 400.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt),
            iconSize: 200.0,
            padding: EdgeInsets.zero,
          ),
          Text("Upload image",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.0))
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
