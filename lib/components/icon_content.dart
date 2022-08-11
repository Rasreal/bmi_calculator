import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
// @dart=2.9

class IconContent extends StatelessWidget {
  final String textt;
  final IconData icon;
  final Color ic_color;
  IconContent(
      {required this.textt, required this.icon, required this.ic_color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        FaIcon(
          icon,
          color: ic_color,
          size: 75,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textt,
          style: label_textSt,
        ),
      ],
    );
  }
}
