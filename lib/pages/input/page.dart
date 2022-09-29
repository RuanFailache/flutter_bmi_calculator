import 'package:bmi_calculator/common/constants/theme.dart';
import 'package:bmi_calculator/common/models/gender.dart';
import 'package:bmi_calculator/pages/input/components/button_controlled_content.dart';
import 'package:bmi_calculator/pages/input/components/icon_content.dart';
import 'package:bmi_calculator/pages/input/components/reusable_card.dart';
import 'package:bmi_calculator/pages/input/controller.dart';
import 'package:bmi_calculator/pages/input/events.dart';
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

  void changeSliderValue(double value) {
    final newHeight = value.round();
    setState(() {
      _inputController.updateHeight(newHeight);
    });
  }

  void changeControllerValueOnClick(
    ButtonEvent event,
    Function(ButtonEvent) callback,
  ) {
    setState(() {
      callback(event);
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
                          Slider(
                            min: kMinHeight,
                            max: kMaxHeight,
                            onChanged: changeSliderValue,
                            inactiveColor: kLightTextColor,
                            activeColor: kBottomContainerColor,
                            value: _inputController.height.toDouble(),
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
                            cardChild: ButtonControlledContent(
                              label: 'WEIGHT',
                              value: _inputController.weight.toString(),
                              onAdd: () => changeControllerValueOnClick(
                                ButtonEvent.add,
                                _inputController.updateWeight,
                              ),
                              onRemove: () => changeControllerValueOnClick(
                                ButtonEvent.remove,
                                _inputController.updateWeight,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            cardChild: ButtonControlledContent(
                              label: 'AGE',
                              value: _inputController.age.toString(),
                              onAdd: () => changeControllerValueOnClick(
                                ButtonEvent.add,
                                _inputController.updateAge,
                              ),
                              onRemove: () => changeControllerValueOnClick(
                                ButtonEvent.remove,
                                _inputController.updateAge,
                              ),
                            ),
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
