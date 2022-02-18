// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoModel _$$_TodoModelFromJson(Map<String, dynamic> json) => _$_TodoModel(
      id: json['id'] as String? ?? '',
      todo: json['todo'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoModelToJson(_$_TodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'isDone': instance.isDone,
    };
