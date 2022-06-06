// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      gameType: json['gameType'] as String? ?? "picante",
    )
      ..players =
          (json['players'] as List<dynamic>).map((e) => e as String).toSet()
      ..prompts =
          (json['prompts'] as List<dynamic>).map((e) => e as String).toSet()
      ..totalRounds = json['totalRounds'] as int
      ..created = DateTime.parse(json['created'] as String);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'players': instance.players.toList(),
      'prompts': instance.prompts.toList(),
      'totalRounds': instance.totalRounds,
      'gameType': instance.gameType,
      'created': instance.created.toIso8601String(),
    };
