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
