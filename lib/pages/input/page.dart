import 'package:bmi_calculator/common/constants/theme.dart';
import 'package:bmi_calculator/common/models/gender.dart';
import 'package:bmi_calculator/pages/input/components/icon_content.dart';
import 'package:bmi_calculator/pages/input/components/reusable_card.dart';
import 'package:bmi_calculator/pages/input/controller.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _inputController = InputController();

  void selectGender(Gender gender) {
    setState(() {
      _inputController.updateSelectedGender(gender);
    });
  }

  Widget _getIconContentByGender(BuildContext context, Gender gender) {
    final isCardSelected = _inputController.selectedGender == gender;

    return GestureDetector(
      onTap: () => selectGender(gender),
      child: ReusableCard(
        color: isCardSelected ? kActiveCardColor : kInactiveCardColor,
        cardChild: IconContent(gender: gender),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _getIconContentByGender(
                            context,
                            Gender.male,
                          ),
                        ),
                        Expanded(
                          child: _getIconContentByGender(
                            context,
                            Gender.female,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                _inputController.height.toString(),
                                style: kNumberTextStyle,
                              ),
                              const Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 24,
                              ),
                            ),
                            child: Slider(
                              min: 50,
                              max: 250,
                              value: _inputController.height.toDouble(),
                              activeColor: kBottomContainerColor,
                              inactiveColor: kLightTextColor,
                              onChanged: (double value) {
                                setState(() {
                                  final newHeight = value.round();
                                  _inputController.updateHeight(newHeight);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Container(),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            cardChild: Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: kBottomContainerHeight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: const Color(0xFFEB1555),
              ),
              child: const Text(
                'CALCULATE',
                style: kLabelTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
