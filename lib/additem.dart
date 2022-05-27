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
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("hello"));
  }
}
