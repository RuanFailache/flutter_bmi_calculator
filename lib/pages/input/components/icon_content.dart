import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

extension GenderExtensions on Gender {
  get text {
    switch (this) {
      case Gender.male:
        return 'MALE';
      case Gender.female:
        return 'FEMALE';
    }
  }
}

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
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
