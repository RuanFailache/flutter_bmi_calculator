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

  Widget getIconContentByGender(BuildContext context, Gender gender) {
    final appColorSchema = Theme.of(context).colorScheme;

    final isCardSelected = _inputController.selectedGender == gender;

    return GestureDetector(
      onTap: () => selectGender(gender),
      child: ReusableCard(
        color: isCardSelected
            ? appColorSchema.surfaceVariant
            : appColorSchema.surface,
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
                          child: getIconContentByGender(
                            context,
                            Gender.male,
                          ),
                        ),
                        Expanded(
                          child: getIconContentByGender(
                            context,
                            Gender.female,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Container(),
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
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: const Color(0xFFEB1555),
            ),
            child: const Text('CALCULATE'),
          ),
        ],
      ),
    );
  }
}
