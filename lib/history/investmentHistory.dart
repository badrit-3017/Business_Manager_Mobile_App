import 'package:expense/history/investmentHistory_list.dart';
import 'package:expense/history/custom_history.dart';
import 'package:expense/models/history.dart';
import 'package:expense/models/investment.dart';
import 'package:expense/screens/home/bottom_sheets.dart/edit_investment_form.dart';
import 'package:expense/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvestmentHistory extends StatefulWidget {
  final Investment investment;
  final String titleFor;

  const InvestmentHistory({ this.investment, this.titleFor}) ;
  
  @override
  _InvestmentHistoryState createState() => _InvestmentHistoryState();
}

class _InvestmentHistoryState extends State<InvestmentHistory> {
  
  
  
  @override
  Widget build(BuildContext context) {
     edit_investment_panel(){
      showModalBottomSheet(context: context, builder: (context){
           return Container(
          padding: EdgeInsets.symmetric(vertical:20.0, horizontal:60.0),
          child: EditInvestmentsForm(investmentFor:widget.titleFor),
        );
      });
    }
   
    return StreamProvider<List<History>>.value(
      value: CustomHistory(investmentName: widget.titleFor).customHistory,
          child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[400],
            title: Text(
              widget.titleFor,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            actions: <Widget>[
               FlatButton.icon(onPressed: (){
              edit_investment_panel();         
            },
             icon: Icon(
               Icons.add,
               color: Colors.white,
               size: 30,           
               ),
              label: Text(
                'New',
              style:TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                
              ),
                )
              ),
            ],
            
          ),
        body: InvestmentHistoryList(),
      ),
    );
  }
}