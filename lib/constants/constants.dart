import 'package:flutter/material.dart';

const headingText=  TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    height: 2.0,
                  );

const decoration = InputDecoration(
                     fillColor: Colors.white,
                     filled: true,
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.white, width: 2.0)
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue, width: 2.0)
                     ),

                   );