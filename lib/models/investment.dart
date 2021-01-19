//Custom investment  object
import 'package:cloud_firestore/cloud_firestore.dart';

class Investment{
  final int income;
  final int expenditure;
  final int profit;
  final Timestamp startDate;
  final String id;

  Investment({this.income, this.expenditure, this.profit, this.startDate, this.id}); 
}