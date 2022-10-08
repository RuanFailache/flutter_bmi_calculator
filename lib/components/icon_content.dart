import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final Gender gender;

  IconData get _genderIcon {
    switch (gender) {
      case Gender.male:
        return FontAwesomeIcons.mars;
      case Gender.female:
        return FontAwesomeIcons.venus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gender.text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
