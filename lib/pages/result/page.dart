import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/result/controller.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required double height,
    required double weight,
  })  : _height = height,
        _weight = weight,
        super(key: key);

  final double _height, _weight;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final calculatorController = CalculatorController(
      height: widget._height,
      weight: widget._weight,
    );

    debugPrint(widget._height.toString());
    debugPrint(widget._weight.toString());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        calculatorController.getResult(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        calculatorController.getBMI(),
                        style: kBMITextStyle,
                      ),
                      Text(
                        calculatorController.getFeedback(),
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              label: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
