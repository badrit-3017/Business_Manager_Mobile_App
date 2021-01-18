import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/history/all_history_list.dart';
import 'package:expense/models/history.dart';
import 'package:flutter/material.dart';
import 'package:expense/services/database.dart';
import 'package:provider/provider.dart';



class AllHistory extends StatefulWidget {
  @override
  _AllHistoryState createState() => _AllHistoryState();
}

class _AllHistoryState extends State<AllHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<History>>.value(
          value: DatabaseService().history,
          child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[400],
            title: Text(
              'All transactions',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0,
           
          ),
         
          body: AllHistoryList(),
         
        ),
    );
  }
}