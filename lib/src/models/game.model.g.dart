// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game()
  ..players = (json['players'] as List<dynamic>).map((e) => e as String).toSet()
  ..prompts =
      (json['prompts'] as List<dynamic>).map((e) => e as String).toList()
  ..totalRounds = json['totalRounds'] as int
  ..tags = (json['tags'] as List<dynamic>).map((e) => e as String).toSet()
  ..created = DateTime.parse(json['created'] as String);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'players': instance.players.toList(),
      'prompts': instance.prompts,
      'totalRounds': instance.totalRounds,
      'tags': instance.tags.toList(),
      'created': instance.created.toIso8601String(),
    };
