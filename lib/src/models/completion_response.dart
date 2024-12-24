import 'package:json_annotation/json_annotation.dart';

part 'completion_response.g.dart';

@JsonSerializable()
class CompletionResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;

  CompletionResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory CompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$CompletionResponseFromJson(json);
}

@JsonSerializable()
class Choice {
  final String text;
  final int index;
  final String finishReason;

  Choice({
    required this.text,
    required this.index,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@JsonSerializable()
class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}
