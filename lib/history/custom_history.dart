
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/models/history.dart';
import 'package:flutter/material.dart';
import 'package:expense/services/database.dart';
import 'package:expense/constants/globals.dart' as globals;


class CustomHistory{
   final String investmentName;
   CustomHistory({this.investmentName});

   final CollectionReference historys = FirebaseFirestore.instance.collection('business').doc(globals.businessName).collection('history');

  
   
  //Stream of investment historys

  List<History> _historyListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return History(
        amount: doc.data()['amount'] ?? 0,
        description : doc.data()['description'] ?? '',
        time: doc.data()['time'] ?? null,
        investmentFor: doc.data()['investmentFor'] ?? null,
        
      );
    }).toList();
  }
  Stream<List<History>> get history {
    return historys.snapshots().map(_historyListFromSnapshot);
  }



  //stream of investment historys for a specific investment
   List<History> _customHistoryListFromSnapshot(QuerySnapshot snapshot){
    List<History> customList = new List<History>();
    List<History> totalList = _historyListFromSnapshot(snapshot);
    totalList.forEach((history) {
      if(history.investmentFor==investmentName)
       customList.add(new History(
        amount: history.amount ?? 0,
        description : history.description ?? '',
        time: history.time ?? null,
        investmentFor: history.investmentFor ?? '',
      ));
    });
     
      
    return customList;

  }

   Stream<List<History>> get customHistory {
    return historys.snapshots().map(_customHistoryListFromSnapshot);
  }




  
}
