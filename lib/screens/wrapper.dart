//This file determines if the user is logged in or not

import 'package:expense/models/user.dart';
import 'package:expense/screens/authenticate/authenticate.dart';
import 'package:expense/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);
    print(user);
    
    //If logged in return home; else authenticate
    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }

  }
}