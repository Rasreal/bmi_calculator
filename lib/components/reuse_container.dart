// @dart=2.9
import 'package:flutter/material.dart';

class Reuse_cont extends StatelessWidget {
  final double topp, bottomm;
  Reuse_cont({
    @required this.col,
    this.topp,
    this.bottomm,
    this.cardChild,
    this.onPress,
  });
  final Color col;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(12, topp, 12, bottomm),
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: col,
        ),
        //height: 180,
        //width: 130,
      ),
    );
  }
}
