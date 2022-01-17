class ValidationException implements Exception {
  Map<String, String> stringResource;

  /// Constructor, [stringResource]
  ValidationException(this.stringResource);

  @override
  String toString() {
    return "ValidationException (${stringResource["en"]})";
  }
}
