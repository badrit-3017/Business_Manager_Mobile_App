import 'package:cloud_firestore/cloud_firestore.dart';

class History{
  final int amount;
  final String description;
  final Timestamp time;
  final String investmentFor;

  History({this.amount, this.description, this.time, this.investmentFor});

  
}