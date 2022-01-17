class UnexpectedException implements Exception {
  String cause;

  /// Constructor, [stringResource]
  UnexpectedException(this.cause);

  @override
  String toString() {
    return "UnexpectedException ($cause)";
  }
}
