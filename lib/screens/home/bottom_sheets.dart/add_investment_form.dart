import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/models/user.dart';
import 'package:expense/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:expense/constants/constants.dart';
import 'package:provider/provider.dart';

class AddInvestmentForm extends StatefulWidget {
  @override
  _AddInvestmentFormState createState() => _AddInvestmentFormState();
}

class _AddInvestmentFormState extends State<AddInvestmentForm> {
  
 final _formkey = GlobalKey<FormState>();
 String name;
 Timestamp startDate = Timestamp.now();
 int expenditure;
 int income;
 int profit;
 
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    return Form(
      key: _formkey,
      child: Column(
         children:<Widget>[
          Text('Start a new Project',style: TextStyle(
            color:Colors.red,
            fontSize: 26,
            ),
            ),
          SizedBox(height: 20.0),
          TextFormField(decoration: decoration,
          validator: (val) => val.isEmpty ? 'Please Enter a name' : null,
          onChanged:  (val) => setState(()=> name = val),
          
          ),
           SizedBox(height: 20.0),
           RaisedButton(
             padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
             color: Colors.red,
             child: Text(
               'Create',
             style: TextStyle(
               color: Colors.white,
               fontSize: 24,
             ),
             ),
             onPressed: () async {
               if(_formkey.currentState.validate()){
                 await DatabaseService(uid:user.uid).addInvestment(name);
                 Navigator.pop(context);
               }
             
               

           }
           ),
     
      ]
     

      ),
    );
  }
}