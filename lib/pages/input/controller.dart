import 'package:bmi_calculator/pages/input/components/icon_content.dart';

class InputController {
  Gender? _selectedGender;

  Gender? get selectedGender => _selectedGender;

  updateSelectedGender(Gender gender) {
    _selectedGender = gender;
  }
}
