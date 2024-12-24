// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionResponse _$CompletionResponseFromJson(Map<String, dynamic> json) =>
    CompletionResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompletionResponseToJson(CompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      text: json['text'] as String,
      index: (json['index'] as num).toInt(),
      finishReason: json['finishReason'] as String,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'text': instance.text,
      'index': instance.index,
      'finishReason': instance.finishReason,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: (json['promptTokens'] as num).toInt(),
      completionTokens: (json['completionTokens'] as num).toInt(),
      totalTokens: (json['totalTokens'] as num).toInt(),
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };
