import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/completion_request.dart';
import 'models/completion_response.dart';

class KrosAIClient {
  final String apiKey;
  final String baseUrl;

  KrosAIClient({
    required this.apiKey,
    this.baseUrl = 'https://api.krosai.com',
  });

  Future<CompletionResponse> createCompletion(CompletionRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return CompletionResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException('Invalid API key');
    } else if (response.statusCode == 429) {
      throw RateLimitException('Rate limit exceeded');
    } else {
      throw KrosAIException(
        'Request failed with status: ${response.statusCode}',
        response.statusCode,
      );
    }
  }
}

class KrosAIException implements Exception {
  final String message;
  final int statusCode;

  KrosAIException(this.message, this.statusCode);
}

class UnauthorizedException extends KrosAIException {
  UnauthorizedException(String message) : super(message, 401);
}

class RateLimitException extends KrosAIException {
  RateLimitException(String message) : super(message, 429);
}
