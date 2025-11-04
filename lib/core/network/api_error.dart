class ApiError {
  final int? statesCode;
  final String message;

  ApiError({this.statesCode, required this.message});
  @override
  String toString() {
    return 'Api{statesCode: $statesCode, message: $message}';
  }
}
