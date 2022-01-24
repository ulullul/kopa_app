enum SignUpFormFields {
  NAME,
  SURNAME,
  CITY,
}

extension Decoder on SignUpFormFields {
  static SignUpFormFields? fromString(String string) => {
        'name': SignUpFormFields.NAME,
        'surname': SignUpFormFields.SURNAME,
        'city': SignUpFormFields.CITY,
      }[string];

  String toSimpleString() => {
        SignUpFormFields.NAME: 'name',
        SignUpFormFields.SURNAME: 'surname',
        SignUpFormFields.CITY: 'city',
      }[this]!;
}
