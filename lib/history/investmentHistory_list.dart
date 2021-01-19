//Investment History tile builder
import 'package:expense/constants/loading.dart';
import 'package:expense/models/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'history_tile.dart';

class InvestmentHistoryList extends StatefulWidget {
  @override
  _InvestmentHistoryListState createState() => _InvestmentHistoryListState();
}

class _InvestmentHistoryListState extends State<InvestmentHistoryList> {
  @override
  Widget build(BuildContext context) {
     final historys = Provider.of<List<History>>(context) ?? [];
     
    return historys==null? Loading(): ListView.builder(
      
      itemCount: historys.length,
      itemBuilder: (context,index){
        return HistoryTile(history: historys[index]);
      },
      
    );
      
    
  }
}