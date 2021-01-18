import 'package:flutter/material.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateBusiness extends StatefulWidget {
  @override
  _CreateBusinessState createState() => _CreateBusinessState();
}

class _CreateBusinessState extends State<CreateBusiness> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[400],
          title: Text(
            'Register your Business',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
           
          ],
        ),
        body: Text('Create Business'),

        
       
      );
  }
}