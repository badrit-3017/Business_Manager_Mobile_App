
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/models/investment.dart';
import 'package:expense/models/investment_list.dart';
import 'package:expense/screens/home/bottom_sheets.dart/add_investment_form.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense/constants/globals.dart' as globals;
// ignore: unused_import
import 'package:expense/services/database.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class Business extends StatefulWidget {
  
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    void _addInvestmentPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical:20.0, horizontal:60.0),
          child: AddInvestmentForm(),
        );
      });

    }
    
    return StreamProvider<List<Investment>>.value(
      value: DatabaseService().investmentDetails,
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
          title: Text(
            'Your Projects',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            FlatButton.icon(onPressed: (){
              _addInvestmentPanel();         
            },
             icon: Icon(
               Icons.add,
               color: Colors.white,
               size: 30,           
               ),
              label: Text('')
              ),
          ],
        ),
        body:  InvestmentList(),

        
       
      ),
    );
  }
}