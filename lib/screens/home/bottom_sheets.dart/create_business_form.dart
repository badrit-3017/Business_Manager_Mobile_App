import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'package:expense/services/database.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/user.dart';

import 'package:expense/constants/constants.dart';
import 'package:flutter/services.dart';

class CreateBusinessForm extends StatefulWidget {
  

  @override
  _CreateBusinessFormState createState() => _CreateBusinessFormState();
}

class _CreateBusinessFormState extends State<CreateBusinessForm> {
 
 final _formkey = GlobalKey<FormState>();
  final CollectionReference business = FirebaseFirestore.instance.collection('business');
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
 
  String name;
    Future createBusiness(String bName,String owner) async {
     print('object');
     await users.doc(globals.uid).set({
       'business':bName,
     });
    return await business.doc(bName).set({
        'employees' : [],
        'owner':owner,
        'secretCode': (Random().nextInt(1000000000)+100000).toString(),
       'time':Timestamp.now(),
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget> [
        
         
           TextFormField(decoration: decoration,
          validator: (val) => val.isEmpty ? 'Please Enter a name' : null,
          onChanged:  (val) => setState(()=> name = val),        
          ),
           SizedBox(height: 20.0),

          //button
          RaisedButton(
           color: Colors.red,
           child: Text(
             'Submit',
             style: TextStyle(
               fontSize: 20.0,
             ),
             ),
             onPressed: () async {
                if(_formkey.currentState.validate()){
                  globals.businessName=name;
                  await createBusiness(name, globals.uid);
               Navigator.pop(context);
               Navigator.pop(context);
              }
                
 
             },
          )
          ],
      ),
    );
  }
}