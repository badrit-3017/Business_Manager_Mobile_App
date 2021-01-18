import 'package:expense/constants/loading.dart';
import 'package:expense/models/investment.dart';
import 'package:expense/models/investment_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class InvestmentList extends StatefulWidget {
  @override
  _InvestmentListState createState() => _InvestmentListState();
}

class _InvestmentListState extends State<InvestmentList> {
  @override
  Widget build(BuildContext context) {

    final investments = Provider.of<List<Investment>>(context) ?? [];
    // print(investments);
   if(investments!=null) investments.forEach((investment) {
     print(investment.income);
     print(investment.expenditure);
     print(investment.profit);
     print(investment.startDate);
     
    });
    
    return investments==null? Loading(): ListView.builder(
      itemCount: investments.length,
      itemBuilder: (context,index){
        return InvestmentTile(investment: investments[index]);
      },
      
    );
  }
}