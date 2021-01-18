import 'package:expense/models/history.dart';
import 'package:expense/screens/home/bottom_sheets.dart/edit_investment_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllHistoryTile extends StatelessWidget {
  final History history;

  const AllHistoryTile({ this.history}) ;
  @override
  Widget build(BuildContext context) {
   
      return Padding(
          padding: EdgeInsets.only(top:8.0),
          child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.blue,
        ) ,
        title: Text(
          history.investmentFor,
        ),
        subtitle: Text(
         history.amount.toString() + 'BDT on ' + DateFormat.yMMMd().add_jm().format(history.time.toDate()),
          
           )
      ),
            ),
          
        );
  }
}