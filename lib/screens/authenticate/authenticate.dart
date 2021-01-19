//basic authenticate class
//has a toggle function to switch between sign in and register

import 'package:expense/screens/authenticate/register.dart';
import 'package:expense/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
 
  bool showSignIn =true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showSignIn){
    return SignIn(toggle: toggleView);
  }
  else{
    return Register(toggle: toggleView);
  }
  }
}