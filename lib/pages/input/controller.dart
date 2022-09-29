import 'package:bmi_calculator/common/models/gender.dart';

class InputController {
  Gender? _selectedGender;

  int _height = 180;

  Gender? get selectedGender => _selectedGender;

  int get height => _height;

  updateSelectedGender(Gender gender) {
    if (selectedGender != gender) {
      _selectedGender = gender;
    } else {
      _selectedGender = null;
    }
  }

  updateHeight(int newHeight) {
    _height = newHeight;
  }
}
