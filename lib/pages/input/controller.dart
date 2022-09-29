import 'package:bmi_calculator/common/models/gender.dart';
import 'package:bmi_calculator/pages/input/events.dart';

const int kInitialHeight = 180;
const double kMinHeight = 50;
const double kMaxHeight = 250;
const int kInitialWeight = 70;
const int kInitialAge = 20;

class InputController {
  Gender? _selectedGender;

  int _height = kInitialHeight;

  int _weight = kInitialWeight;

  int _age = kInitialAge;

  Gender? get selectedGender => _selectedGender;

  int get height => _height;

  int get weight => _weight;

  int get age => _age;

  void updateSelectedGender(Gender gender) {
    if (selectedGender != gender) {
      _selectedGender = gender;
    } else {
      _selectedGender = null;
    }
  }

  void updateHeight(int newHeight) {
    _height = newHeight;
  }

  void updateWeight(ButtonEvent event) {
    switch (event) {
      case ButtonEvent.add:
        _weight += 1;
        break;
      case ButtonEvent.remove:
        if (_weight > 1) _weight -= 1;
        break;
    }
  }

  void updateAge(ButtonEvent event) {
    switch (event) {
      case ButtonEvent.add:
        _age += 1;
        break;
      case ButtonEvent.remove:
        if (_age > 1) _age -= 1;
        break;
    }
  }
}
