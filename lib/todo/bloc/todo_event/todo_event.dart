import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoList extends TodoEvent {}

class GetTodoList extends TodoEvent {}

class DeleteTodoList extends TodoEvent {}

class UpdateTodoList extends TodoEvent {}
