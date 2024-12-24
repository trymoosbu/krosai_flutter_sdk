import 'package:json_annotation/json_annotation.dart';

part 'completion_request.g.dart';

@JsonSerializable()
class CompletionRequest {
  final String prompt;
  final String model;
  final int? maxTokens;
  final double? temperature;
  final double? topP;

  CompletionRequest({
    required this.prompt,
    required this.model,
    this.maxTokens = 100,
    this.temperature = 0.7,
    this.topP = 1,
  });

  Map<String, dynamic> toJson() => _$CompletionRequestToJson(this);
}
