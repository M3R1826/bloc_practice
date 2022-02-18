import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const TodoModel._();
  const factory TodoModel({
    @Default('') String id,
    @Default('') String todo,
    @Default(false) bool isDone,
    @JsonKey(ignore: true) DocumentReference? documentReference,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json,
          {DocumentReference? ref}) =>
      _$TodoModelFromJson(json).copyWith(documentReference: ref);
  String? get documentId => documentReference?.id;
}
