import 'package:bloc_arch_test/todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_arch_test/todo/bloc/todo_event/todo_event.dart';
import 'package:bloc_arch_test/todo/view/state_controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({Key? key, required this.todoBloc}) : super(key: key);
  final TodoBloc todoBloc;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("What's Your Todo?"),
      content: TextFormField(
        onChanged: (v) =>
            Provider.of<TodoStateController>(context, listen: false)
                .setTitle(v),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              await Provider.of<TodoStateController>(context, listen: false)
                  .createTodo();
              todoBloc.add(GetTodoList());
              Navigator.pop(context);
            },
            child: const Text('追加する'))
      ],
    );
  }
}
