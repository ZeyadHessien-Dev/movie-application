import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException({
    required this.message,
  });
}
