import 'package:expense/screens/home/bottom_sheets.dart/create_business_form.dart';
import 'package:flutter/material.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBusiness extends StatefulWidget {
  @override
  _CreateBusinessState createState() => _CreateBusinessState();
}

class _CreateBusinessState extends State<CreateBusiness> {
  @override
  Widget build(BuildContext context) {
     create_business_panel(){
      showModalBottomSheet(context: context, builder: (context){
           return Container(
          padding: EdgeInsets.symmetric(vertical:20.0, horizontal:60.0),
          child:CreateBusinessForm()
        );
      });
    }
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent[400],
          title: Text(
            'Register your Business',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
           
          ],
        ),
        body:Container(
          
          child: Column(
            
            children: <Widget> [
              SizedBox(height: 20.0),
              Center(child: Text(
                'Lets get started on your new business!',
                style:TextStyle(
                  fontSize: 20,                
                ),
              ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: (){
                  create_business_panel();
                },
                color: Colors.pink,
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

              )
            ],
          ),
        ),

        
       
      );
  }
}