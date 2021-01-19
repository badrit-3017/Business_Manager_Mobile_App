//This is the home page of our application

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/error_checking.dart/cons.dart';
import 'package:expense/error_checking.dart/create_business.dart';
import 'package:expense/options/allHistory.dart';
import 'package:expense/options/business.dart';
import 'package:expense/options/gridOption.dart';
import 'package:flutter/material.dart';
import 'package:expense/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense/services/auth.dart';
import 'package:expense/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/constants/globals.dart' as globals;

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  
  //listing all variables
  final AuthService _auth = AuthService();
  


  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Scaffold(
        
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Colors.lightGreen[400],

              ),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   SizedBox(
                   height: 0,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                      Align(
                    alignment: Alignment.topLeft,
                   child: Text(
                     'P O U S H',                   
                     style:GoogleFonts.francoisOne(
                       fontSize: 28,
                       fontWeight: FontWeight.w800,
                       color: Colors.white,
                     ),
                     )
                  ),
                   Align(
                    alignment: Alignment.topRight,
                   child: Container(                    
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(       
                        shape: BoxShape.rectangle,                  
                      ),
                      child: FlatButton.icon(
                        onPressed:() async {    
                          await _auth.signOut();
                        } , 
                        icon: Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                          ), 
                        label: Text(''))
                    ),
                  ),
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                  Text(
                    
                    'Welcome ${globals.userName},  ',
                    
                    style: headingText,
                    ),
                    
                    Text(
                    'What are you planning to invest on today?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      height: 2.0,
                    ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    Expanded(
                          child: GridView.count(
                            
                          crossAxisCount:2,
                          childAspectRatio: .90,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 25,
                          children: <Widget>[
                            InkResponse(
                              onTap: (){
                                       //function here
                                    Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => Construction()),
                                   );
                                    },
                            child:GridOption(
                              title: 'Personal',
                              source: "assets/001-house.svg",      
                            ),),
                            InkResponse(
                               onTap: (){
                                 if(globals.businessName=='') {

                                    Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => CreateBusiness()),
                                   );

                                  }
                                  else{
                                     Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => Business()),
                                   );

                                  }
                                       
                                   
                                    },
                                                          child: GridOption(
                                 title: 'Business',
                                 source: "assets/007-office.svg",                                
                              ),
                            ),
                            InkResponse(
                               onTap: (){
                                          if(globals.businessName=='') {

                                    Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => CreateBusiness()),
                                   );

                                  }
                                  else{
                                     Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => AllHistory()),
                                   );

                                  }
                                    },
                                    
                                 child: GridOption(
                                 title: 'History',
                                 source: "assets/013-history.svg",
                              ),
                            ),
                            InkResponse(
                                 onTap: (){
                                       //function here
                                    Navigator.push(
                                               context,
                                    MaterialPageRoute(builder: (context) => Construction()),
                                   );
                                    },
                                child: GridOption(
                                 title: 'Inventory',
                                 source: "assets/012-check-list.svg",
                              ),
                            ),
                          ], 
                        
                        ),
                      )                  
                ],
               
              ),
            ),

          ),

          ],
        ),
        
     
    );
  }
}
