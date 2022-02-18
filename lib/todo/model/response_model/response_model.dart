import 'package:bloc_arch_test/todo/model/todo_model/todo_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({@Default([]) List<TodoModel> responseList}) =
      _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
