//constants.dart: This file contains constants

import 'package:flutter/material.dart';

const headingText=  TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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