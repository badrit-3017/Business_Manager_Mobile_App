import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'package:expense/services/database.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/user.dart';

import 'package:expense/constants/constants.dart';
import 'package:flutter/services.dart';

class EditInvestmentsForm extends StatefulWidget {
  final String investmentFor ;

  const EditInvestmentsForm({this.investmentFor});
  @override
  _EditInvestmentsFormState createState() => _EditInvestmentsFormState();
}

class _EditInvestmentsFormState extends State<EditInvestmentsForm> {
 
 final _formkey = GlobalKey<FormState>();
 final List<String> transactionType = ['Income','Expenditure'];
 
  int amount;
  String description;
  
  Timestamp time =Timestamp.now();
  String trans;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget> [
          Text('Add your Transaction',style: TextStyle(
            color:Colors.red,
            fontSize: 22,
            ),
            ),
          SizedBox(height: 20.0),
          //3 text fields: amount, description and transaction type
           TextFormField(decoration: decoration,
          validator: (val) => val.isEmpty ? 'Please Enter a name' : null,
          onChanged:  (val) => setState(()=> description = val),
          
          ),
           SizedBox(height: 20.0),
          TextFormField(
            decoration: decoration,
             keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
              ],
             validator: (val) => val.isEmpty ? 'Please Enter a valid amount' : null,
             onChanged:  (val) => setState(()=> amount = int.parse(val),
          ),
          ),
          SizedBox(height: 20.0),
          //dropdown
          ButtonTheme(
            alignedDropdown: true,
             child: DropdownButtonFormField(
              onChanged:  (val) => setState(()=> trans = val),
            dropdownColor: Colors.red,
             items: transactionType.map((transaction){
                    return DropdownMenuItem(
                      value: transaction,
                      child: Center(
                        child: Text(
                          '$transaction',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,                          
                          ),
                          ),
                      ),
                    );
                  }).toList(),
                ),
          ),

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
                  await DatabaseService(uid:globals.uid).addHistory(amount, description, widget.investmentFor); 
               Navigator.pop(context);
 
              }
                Navigator.pop(context);
 
             },
          )
          ],
      ),
    );
  }
}