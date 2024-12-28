class CustomException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;

  CustomException({
    this.code,
    int? statusCode,
    required this.message,
  }) : statusCode = statusCode ?? 500;
}
