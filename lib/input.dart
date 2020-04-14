import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container.dart';
import 'icon_style.dart';
import 'resultpage.dart';
import 'calculatorbrain.dart';

const bottoncontainer = 80.0;
const activecolour = Color(0xFF1D1E33);
const inactivecolour = Color(0xFF111328);
enum gender { male, female }
gender selected;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = gender.male;
                      });
                    },
                    child: reuseable(
                      colour: selected == gender.male
                          ? activecolour
                          : inactivecolour,
                      cardchild: containerstyle(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = gender.female;
                      });
                    },
                    child: reuseable(
                      colour: selected == gender.female
                          ? activecolour
                          : inactivecolour,
                      cardchild: containerstyle(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reuseable(
                colour: activecolour,
                cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                          style: TextStyle(
                              color: Color(0xFF8D8E98), fontSize: 18.0)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(height.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 50.0)),
                            Text('cm',
                                style: TextStyle(
                                    color: Color(0xFF8D8E98), fontSize: 18.0))
                          ]),
                      Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    ])),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reuseable(
                    colour: activecolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              color: Color(0xFF8D8E98), fontSize: 18.0),
                        ),
                        Text(weight.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 50.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            roundicon(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            roundicon(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuseable(
                    colour: activecolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                              color: Color(0xFF8D8E98), fontSize: 18.0),
                        ),
                        Text(age.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 50.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            roundicon(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            roundicon(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
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
              calculate calc = calculate(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => result(
                            bmi: calc.bmi(),
                            results: calc.result(),
                            interpretation: calc.interpretation(),
                          )));
            },
            child: Container(
                child: Center(
                  child: Text('CALCULATE',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 30.0)),
                ),
                color: Color(0xFFEB1555),
                height: bottoncontainer,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class roundicon extends StatelessWidget {
  roundicon({this.icon, this.onpressed});
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
