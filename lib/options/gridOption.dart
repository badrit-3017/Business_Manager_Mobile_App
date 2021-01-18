import 'package:expense/options/business.dart';
import 'package:flutter/material.dart';
import 'package:expense/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridOption extends StatelessWidget {
  final String title;
  final String source;
  const GridOption({
    Key key, this.title, this.source
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(                            
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          SvgPicture.asset(
            source,
            width: 100,
            ), 
          //asset picture
          //spacer
          Spacer(),
          Text(
            title,
            style: headingText,
            ),

        ],
      ),
    );
  }
}
