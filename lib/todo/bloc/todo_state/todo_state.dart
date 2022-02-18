import 'package:bloc_arch_test/covid/model/covid_model.dart';
import 'package:bloc_arch_test/todo/model/response_model/response_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {
  final ResponseModel todoModel;
  const TodoSuccess(this.todoModel);
}

class TodoError extends TodoState {
  final String? message;
  const TodoError(this.message);
}
