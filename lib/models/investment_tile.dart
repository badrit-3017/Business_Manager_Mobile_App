import 'package:expense/history/investmentHistory.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/investment.dart';
import 'package:intl/intl.dart';

class InvestmentTile extends StatelessWidget {
  final Investment investment;

  const InvestmentTile({ this.investment}) ;
  @override
  Widget build(BuildContext context) {
    
    return InkResponse(
      onTap: (){
         Navigator.push(
         context,
        MaterialPageRoute(builder: (context) => InvestmentHistory(investment:investment, titleFor: investment.id)),
       );
      },
          child: Padding(
        padding: EdgeInsets.only(top:8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.blue,
              ) ,
              title: Text(
        investment.id,
              ),
              subtitle: Text(
        DateFormat.yMMMd().add_jm().format(investment.startDate.toDate()),
        
         )
            ),
          ),
        
      ),
    );
  }
}