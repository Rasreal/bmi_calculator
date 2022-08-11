// @dart=2.9
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reuse_container.dart';
import '../components/height.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import 'package:bmi_calculator/calcBrain.dart';
import 'package:bmi_calculator/globals.dart';

enum Gender {
  male,
  female,
  nol, //just null gender
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactive_color_gender;
  Color femaleColor = inactive_color_gender;

  Gender selected;
  int weight = 65;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Reuse_cont(
                      col: selected == Gender.male
                          ? active_color_gender
                          : inactive_color_gender,
                      topp: 10,
                      bottomm: 12,
                      cardChild: IconContent(
                        textt: 'MEN',
                        icon: FontAwesomeIcons.mars,
                        ic_color: Colors.blue[700],
                      ),
                      onPress: () {
                        setState(() {
                          selected = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: Reuse_cont(
                    col: selected == Gender.female
                        ? active_color_gender
                        : inactive_color_gender,
                    topp: 10,
                    bottomm: 12,
                    cardChild: IconContent(
                      textt: 'WOMEN',
                      icon: FontAwesomeIcons.venus,
                      ic_color: Colors.red[800],
                    ),
                    onPress: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuse_cont(
              col: active_color_gender,
              topp: 5,
              bottomm: 5,
              cardChild: Height(),
            ),
          ),
          Expanded(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Reuse_cont(
                    col: active_color_gender,
                    topp: 8,
                    bottomm: 5,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //textBaseline: TextBaseline.ideographic,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.weightScale,
                              size: 25,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('WEIGHT', style: label_textSt),
                          ],
                        ),
                        Center(
                          child: Text(
                            weight.toString(),
                            style: height_text_style,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                button_icon: FontAwesomeIcons.minus,
                                button_color: roundbtn_color1,
                                onPress_btn: () {
                                  setState(() {
                                    weight > 30
                                        ? weight--
                                        : this.weight = weight;
                                  });
                                },
                                onLongPress_btn: () {
                                  setState(() {
                                    weight - 10 > 30
                                        ? weight = weight - 10
                                        : this.weight = weight;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                button_icon: FontAwesomeIcons.plus,
                                button_color: roundbtn_color2,
                                onPress_btn: () {
                                  setState(() {
                                    weight < 140
                                        ? weight++
                                        : this.weight = weight;
                                  });
                                },
                                onLongPress_btn: () {
                                  setState(() {
                                    weight + 10 < 140
                                        ? weight = weight + 10
                                        : this.weight = weight;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuse_cont(
                    col: active_color_gender,
                    topp: 8,
                    bottomm: 5,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.personCane,
                              size: 35,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('AGE'),
                          ],
                        ),
                        Center(
                          child: Text(
                            age.toString(),
                            style: height_text_style,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                button_icon: FontAwesomeIcons.minus,
                                button_color: roundbtn_color1,
                                onPress_btn: () {
                                  setState(() {
                                    age > 12 ? age-- : this.age = age;
                                  });
                                },
                                onLongPress_btn: () {
                                  setState(() {
                                    age - 10 > 12 ? age -= 10 : this.age = age;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                button_icon: FontAwesomeIcons.plus,
                                button_color: roundbtn_color2,
                                onPress_btn: () {
                                  setState(() {
                                    age < 80 ? age++ : this.age = age;
                                  });
                                },
                                onLongPress_btn: () {
                                  setState(() {
                                    age + 10 < 80 ? age += 10 : this.age = age;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (selected == Gender.male || selected == Gender.female) {
                  CalcBrain calc_brain = CalcBrain(
                      weight: weight.toDouble(), height: height.toDouble());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        res_condition: calc_brain.getRes(),
                        res_index: calc_brain.CalcBMI(),
                        res_interp: calc_brain.getInterp(),
                        age: age.toString(),
                        heightt: height.toString(),
                        gender: selected.toString(),
                      ),
                    ),
                  );
                } else {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Something went wrong",
                    desc: "You should choose the gender",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
              });
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: height_text_style.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 43,
                      letterSpacing: 2),
                ),
              ),
              height: 80,
              width: 355,
              margin: EdgeInsets.fromLTRB(0, 8, 0, 16),
              decoration: BoxDecoration(
                color: bottom_color_cont,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
        ],
      ),
      /*floatingActionButton: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.dark(
            secondary: Colors.pink,
          ),
          highlightColor: Colors.pink,
          canvasColor: Colors.black,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),*/
    );
  }
}

class RoundButton extends StatelessWidget {
  final Color button_color;
  final IconData button_icon;
  final Function onPress_btn;
  final Function onLongPress_btn;
  RoundButton({
    @required this.button_icon,
    @required this.button_color,
    @required this.onPress_btn,
    @required this.onLongPress_btn,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        button_icon,
        color: Colors.white,
      ),
      onPressed: onPress_btn,
      onLongPress: onLongPress_btn,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        width: 54,
        height: 54,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: button_color,
    );
  }
}
