import 'package:calc_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcUi extends StatefulWidget {
  const CalcUi({super.key});

  @override
  State<CalcUi> createState() => _CalcUiState();
}

class _CalcUiState extends State<CalcUi> {
  var userdata = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Center(
              child: Text(
            'Calculator',
            style: TextStyle(color: Colors.white),
          )),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            userdata.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            result.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 34),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata = '';
                              result = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            buttonColor: Colors.grey,
                            onPress: () {
                              percentageFunc();
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            buttonColor: Colors.orange,
                            onPress: () {
                              userdata += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '*',
                            buttonColor: Colors.orange,
                            onPress: () {
                              userdata += '*';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            buttonColor: Colors.orange,
                            onPress: () {
                              userdata += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            buttonColor: Colors.orange,
                            onPress: () {
                              userdata += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            buttonColor: Colors.grey,
                            onPress: () {
                              userdata =
                                  userdata.substring(0, userdata.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            buttonColor: Colors.orange,
                            onPress: () {
                              equalButton();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void equalButton() {
    Parser p = Parser();
    Expression exp = p.parse(userdata);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

  void percentageFunc() {
    var myInt = int.parse(userdata);
    userdata = ((myInt / 100).toString());
  }
}
