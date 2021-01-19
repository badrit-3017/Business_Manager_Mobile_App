//Body for showing all transactions by the user

import 'package:expense/constants/loading.dart';
import 'package:expense/history/all_history_tile.dart';
import 'package:expense/models/history.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'history_tile.dart';

class AllHistoryList extends StatefulWidget {
  @override
  _AllHistoryListState createState() => _AllHistoryListState();
}

class _AllHistoryListState extends State<AllHistoryList> {
  @override
  Widget build(BuildContext context) {
    final historys = Provider.of<List<History>>(context);
       
    return historys==null? Loading(): ListView.builder(
      
      itemCount: historys.length,
      itemBuilder: (context,index){
        return AllHistoryTile(history: historys[index]);
      });
  }
}