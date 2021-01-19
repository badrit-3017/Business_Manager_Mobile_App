import 'package:expense/constants/constants.dart';
import 'package:expense/constants/loading.dart';
import 'package:expense/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {

  final Function toggle;
  Register({this.toggle});

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text field variables
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Register'),
         actions: <Widget> [
          FlatButton.icon(
          onPressed: () {
            widget.toggle();
          },
           icon: Icon(Icons.apps), 
           label: Text('Sign In')) 
        ]
      
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                SizedBox(height:20),

                 //name
                TextFormField(
                  decoration: decoration.copyWith(hintText: 'Name',), //decoration is a constant declared elsewhere
                  validator: (val) => val.isEmpty ? 'Enter your name' : null,
                  onChanged: (val){
                    setState(() {
                      name = val.trim();
                    });
                  },
                ),
                  SizedBox(height:20),
                //email
                TextFormField(
                  decoration: decoration.copyWith(hintText: 'Email',), //decoration is a constant declared elsewhere
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() {
                      email = val.trim();
                    });
                  },
                ),
                SizedBox( height:20),
                //password
                 TextFormField(
                   decoration: decoration.copyWith(hintText: 'Password',), //decoration is a constant declared elsewhere                   
                   obscureText: true,
                   validator: (val) => val.length<6 ? 'Enter an password longer than 6 chars' : null,
                  onChanged: (val){
                     setState(() {
                      password = val;
                    });
                  },
                 ),
                 SizedBox( height:20),
                 RaisedButton(
                   color: Colors.purple[900],
                   child: Text(
                     'Register',
                     style: GoogleFonts.lato(
                       color: Colors.white,
                     ),
                   ),
                   onPressed: () async {
                     if(_formKey.currentState.validate()){
                       setState(() {
                         loading = true;
                       });
                    dynamic result = await _auth.registerUser(name, email, password);
                    if(result==null){
                      setState(() {
                        error='Please enter a valid email';
                        loading = false;
                      });
                    }
                   }
                   }
                 ),
                 SizedBox(height:12),
                 Text(
                   error,
                   style: TextStyle(
                     fontSize: 20,
                     color: Colors.red[700],
                   ),
                   ),
              ],
            ),
          ) 
        )
      ),
    );
  }
}