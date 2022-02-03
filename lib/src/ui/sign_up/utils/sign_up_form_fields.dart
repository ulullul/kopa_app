enum SignUpFormFields {
  CITY,
  FIRST_NAME,
  LAST_NAME,
}

extension Decoder on SignUpFormFields {
  static SignUpFormFields? fromString(String string) => {
        'city': SignUpFormFields.CITY,
        'first_name': SignUpFormFields.FIRST_NAME,
        'last_name': SignUpFormFields.LAST_NAME,
      }[string];

  String toSimpleString() => {
        SignUpFormFields.CITY: 'city',
        SignUpFormFields.FIRST_NAME: 'first_name',
        SignUpFormFields.LAST_NAME: 'last_name',
      }[this]!;
}
