// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseModel _$$_ResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ResponseModel(
      responseList: (json['responseList'] as List<dynamic>?)
              ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResponseModelToJson(_$_ResponseModel instance) =>
    <String, dynamic>{
      'responseList': instance.responseList,
    };
