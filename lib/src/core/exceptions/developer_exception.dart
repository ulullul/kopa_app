class DeveloperException implements Exception {
  String message;

  /// Constructor, [stringResource]
  DeveloperException(this.message);

  @override
  String toString() {
    return "DeveloperException ($message})";
  }
}
