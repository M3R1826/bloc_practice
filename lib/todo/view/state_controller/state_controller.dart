import 'package:bloc_arch_test/todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_arch_test/todo/bloc/todo_event/todo_event.dart';
import 'package:bloc_arch_test/todo/repository/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

class TodoStateController extends ChangeNotifier {
  TodoStateController(this.context);
  String title = '';
  final TodoRepository _repository = TodoRepository();

  final BuildContext context;
  //final TodoBloc _todoBloc = TodoBloc();
  late final TodoBloc todoBloc = context.read();

  void setTitle(String v) {
    title = v;
    notifyListeners();
  }

  bool selfValidation() {
    if (title == '') {
      return false;
    } else if (title.trim() == '') {
      return false;
    } else {
      return true;
    }
  }

  Future<void> createTodo() async {
    if (selfValidation() == true) {
      todoBloc.add(CreateTodoList(title));
    }
  }

  // Future<void> updateTodo(String id, bool isDone) async {
  //   await _repository.updateData(id, isDone);
  //   _todoBloc.add(GetTodoList());
  // }

  Future<void> deleteTodo(String id) async {
    await _repository.deleteData(id);
    todoBloc.add(GetTodoList());
  }
}
