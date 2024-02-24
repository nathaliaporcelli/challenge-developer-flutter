class CeslaException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const CeslaException({
    required this.message,
    this.stackTrace = StackTrace.empty,
  });
}
