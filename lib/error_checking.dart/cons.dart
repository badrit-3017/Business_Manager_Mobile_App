//cons.dart: This file contains a widget showing pages under construction
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Construction extends StatefulWidget {
  @override
  _ConstructionState createState() => _ConstructionState();
}

class _ConstructionState extends State<Construction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page under Construction',
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body:  Container(
      color: Colors.white,
      child: new LayoutBuilder(builder: (context, constraint) {
        return Center(child: new Icon(Icons.settings, size: constraint.biggest.width, color: Colors.black26,));
      }),
    ),
    );
  }
}