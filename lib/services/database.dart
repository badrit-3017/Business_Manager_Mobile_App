import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'package:expense/models/history.dart';
import 'package:expense/models/investment.dart';
import 'dart:math';

class DatabaseService {
  
  //collection reference
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference business = FirebaseFirestore.instance.collection('business');
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  final CollectionReference investments = FirebaseFirestore.instance.collection('business').doc(globals.businessName).collection('investments');
  final CollectionReference historys = FirebaseFirestore.instance.collection('business').doc(globals.businessName).collection('history') ;
  


  Future addInvestment(String name) async {

    return await investments.doc(name).set({
      'expenditure' : 0,
      'income' :0,
       'profit' : 0,
       'startDate':Timestamp.now(),
    });
    
    
  }
  Future addHistory(int amount, String description, String investmentFor) async {
    return await historys.doc().set({
      'amount' : amount,
      'description' :description,
       'investmentFor' : investmentFor,
       'time':Timestamp.now(),
    });
  }
  //create a business
 




 

  //getting the investment list from our snapshots
  List<Investment> _investmentListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Investment(
        income: doc.data()['income'] ?? 0,
        expenditure: doc.data()['expenditure'] ?? 0,
        profit: doc.data()['profit'] ?? 0,
        startDate: doc.data()['startDate'] ?? null,
        id: doc.id,
        );
    }).toList();
  }

    Stream<List<Investment>> get investmentDetails {

    return investments.snapshots()
    .map(_investmentListFromSnapshot);
    
  }

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
  
}