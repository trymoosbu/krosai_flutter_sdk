# KrosAI Flutter SDK

A Flutter SDK for KrosAI API, providing easy access to text completions and language models.

## Features

- 🚀 **Simple and intuitive API**: Easy to use and understand.
- ✨ **Type-safe request and response models**: Ensures data integrity and prevents errors.
- 🛡️ **Built-in error handling**: Handles common errors and exceptions.
- 📝 **Comprehensive documentation**: Detailed documentation for easy integration.

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  krosai_flutter_sdk: ^0.0.1
```

You'll need to obtain an API key from [KrosAI Platform Dashboard](https://platform.krosai.com).

## Usage

### Initialize the client

```dart
final client = KrosAIClient(apiKey: 'YOUR_API_KEY');
```dart
try {
  final response = await client.createCompletion(
    CompletionRequest(
      prompt: 'Translate to Yoruba: Hello, how are you?',
      model: KrosAIModels.krosMLingual101,
      temperature: 0.7,
    ),
  );
  print(response.choices.first.text);
} on UnauthorizedException catch (e) {
  print('Authentication failed: ${e.message}');
} on RateLimitException catch (e) {
  print('Rate limit exceeded: ${e.message}');
} on KrosAIException catch (e) {
  print('API error: ${e.message}');
}
```

### Configuration Options

When creating a completion request, you can customize these parameters:

- `prompt` (required): The input text to process
- `model` (required): The model to use (e.g., `KrosAIModels.krosMLingual101`)
- `maxTokens` (optional): Maximum number of tokens to generate (default: 100)
- `temperature` (optional): Controls randomness (0.0 to 1.0, default: 0.7)
- `topP` (optional): Controls diversity via nucleus sampling (0.0 to 1.0, default: 1.0)

### Response Structure

The completion response includes:

```dart
CompletionResponse {
  String id;           // Unique identifier for the completion
  String object;       // Object type
  int created;         // Unix timestamp
  String model;        // Model used
  List<Choice> choices; // Generated completions
  Usage usage;         // Token usage statistics
}

Choice {
  String text;         // Generated text
  int index;          // Choice index
  String finishReason; // Why the completion finished
}

Usage {
  int promptTokens;     // Tokens in the prompt
  int completionTokens; // Tokens in the completion
  int totalTokens;      // Total tokens used
}
```

## Error Handling

The SDK provides specific exceptions for common error cases:

- `UnauthorizedException`: Invalid API key
- `RateLimitException`: Too many requests
- `KrosAIException`: Generic API errors

## Additional Information

- [API Documentation](https://docs.krosai.com)
- [KrosAI Dashboard](https://platform.krosai.com)
- [Support](mailto:hey@krosai.com)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
