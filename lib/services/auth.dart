import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/user.dart';
import 'package:expense/constants/globals.dart' as globals;
import 'dart:math';
import 'package:expense/models/history.dart';
import 'package:expense/models/investment.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creating a Custom User Object
  CustomUser _customUser(User user){
    return user !=null ? CustomUser(uid: user.uid) : null;
  }

  //auth changing upon user stream

  Stream<CustomUser> get user{
    return _auth.authStateChanges().map((User user) => _customUser(user));
  }

  //sign in anonymously

  Future signInAnon() async {
    try {
     UserCredential result = await _auth.signInAnonymously();
     User user = result.user;
     return _customUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      globals.uid = user.uid;
      DocumentSnapshot userDetails  = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      globals.userName = userDetails['name'].toString();
      globals.businessName = userDetails['business'].toString();
      print("THe business name is "+globals.businessName);
      return _customUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }





  //register with email and password 
  //(Through this method we create the users collection which has two parameters: name:'given name when registering' and business: null )
  Future registerUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      globals.uid = user.uid;
      //register the user with their name
      await Creator(uid:user.uid).createUserData(name,'');      
      DocumentSnapshot userDetails  = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      globals.userName = name;
      return _customUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    globals.uid='';globals.businessName ='';globals.userName='';
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}
class Creator{

  //collection reference
  final String uid;

  Creator({this.uid});

  
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  Future createUserData(String name, String business) async {

    return await users.doc(uid).set({
      'name' : name,
      'business' :business,

    });
  }
}

    
    