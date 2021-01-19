//بسم الله الرحمن الرحيم
//In the name of Allah, The Most Gracious and The Most Merciful


//App Name: Poush Business Manager
//Developed by: Badrit Bin Imran
//Frameworks used:  Cloud firestore as a backend


import 'package:expense/models/user.dart';
import 'package:expense/screens/home/home.dart';
import 'package:expense/screens/wrapper.dart';
import 'package:expense/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
      home:Wrapper(),
      ),
    );
  }
}
     