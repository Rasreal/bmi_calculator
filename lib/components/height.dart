import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmi_calculator/globals.dart';

class Height extends StatefulWidget {
  const Height({Key? key}) : super(key: key);

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  //global int height = 185;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.scaleUnbalanced,
              size: 35,
              color: Colors.white70,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'HEIGHT',
              //style: height_text_style,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              height.toString(),
              style: height_text_style,
            ),
            Text(
              'cm',
              style: label_textSt,
            ),
          ],
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.blue[400],
              inactiveTrackColor: Colors.red[900],
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              thumbColor: thumb_color,
              overlayColor: Colors.white30,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 130,
              max: 210,
              onChanged: (double newHeight) {
                setState(() {
                  height = newHeight.round();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
