import 'package:bmi_calculator/common/components/circle_icon_button.dart';
import 'package:bmi_calculator/common/constants/theme.dart';
import 'package:flutter/material.dart';

class ButtonControlledContent extends StatelessWidget {
  const ButtonControlledContent({
    Key? key,
    required this.onAdd,
    required this.label,
    required this.value,
    required this.onRemove,
  }) : super(key: key);

  final String label, value;
  final void Function() onAdd, onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        Text(value, style: kNumberTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIconButton(
              icon: Icons.remove,
              onPressed: onRemove,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleIconButton(
              icon: Icons.add,
              onPressed: onAdd,
            ),
          ],
        ),
      ],
    );
  }
}
