import 'package:bmi_calculator/components/reuse_container.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calcBrain.dart';

class ResultsPage extends StatelessWidget {
  final Text res_condition;
  final String res_index;
  final String res_interp;
  final String gender;
  final String heightt;
  final String age;
  ResultsPage(
      {required this.res_condition,
      required this.res_index,
      required this.res_interp,
      required this.gender,
      required this.heightt,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFC0A0E21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xCC0A0E21),
          //shadowColor: Color(0x0A0E21),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            // Text's default color
            color: Colors.white54,
            fontSize: 35,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Your Result",
                style: your_result_style,
              ),
            ),
            Expanded(
              child: Reuse_cont(
                col: Color(0xCC33364A),
                topp: 15,
                bottomm: 2,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: res_condition),
                    Text(
                      res_index,
                      style: res_index_style,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE:  ',
                          style: result_text_style,
                        ),
                        Text(
                          age.toString(),
                          style: result_text_style,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT:  ',
                          style: result_text_style,
                        ),
                        Text(
                          heightt.toString(),
                          style: result_text_style,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GENDER:  ',
                          style: result_text_style,
                        ),
                        Text(
                          gender.toString(),
                          style: result_text_style,
                        )
                      ],
                    ),
                    Text(
                      res_interp,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RECALCULATE',
                    style: height_text_style.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 43,
                        letterSpacing: 2),
                  ),
                ),
                height: 75,
                width: 355,
                margin: EdgeInsets.fromLTRB(0, 25, 0, 22),
                decoration: BoxDecoration(
                  color: bottom_color_cont,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
