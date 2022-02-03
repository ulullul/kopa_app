enum UpsertFormFields {
  PHOTOS,
  MODEL,
  FABRIC,
  DESCRIPTION,
  PRICE,
  SIZE,
  LENGTH,
  WIDTH,
}

extension UpsertFormDecoder on UpsertFormFields {
  static UpsertFormFields? fromString(String string) => {
        'photos': UpsertFormFields.PHOTOS,
        'model': UpsertFormFields.MODEL,
        'fabric': UpsertFormFields.FABRIC,
        'description': UpsertFormFields.DESCRIPTION,
        'price': UpsertFormFields.PRICE,
        'size': UpsertFormFields.SIZE,
        'length': UpsertFormFields.LENGTH,
        'width': UpsertFormFields.WIDTH,
      }[string];

  String toSimpleString() => {
        UpsertFormFields.PHOTOS: 'photos',
        UpsertFormFields.MODEL: 'model',
        UpsertFormFields.FABRIC: 'fabric',
        UpsertFormFields.DESCRIPTION: 'description',
        UpsertFormFields.PRICE: 'price',
        UpsertFormFields.SIZE: 'size',
        UpsertFormFields.LENGTH: 'length',
        UpsertFormFields.WIDTH: 'width',
      }[this]!;
}
