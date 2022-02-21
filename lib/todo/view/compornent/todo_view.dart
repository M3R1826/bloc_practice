import 'package:bloc_arch_test/todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_arch_test/todo/bloc/todo_event/todo_event.dart';
import 'package:bloc_arch_test/todo/model/response_model/response_model.dart';
import 'package:bloc_arch_test/todo/view/state_controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key, required this.list, required this.todoBloc})
      : super(key: key);
  final ResponseModel list;
  final TodoBloc todoBloc;
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    final _res = widget.list;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (v) =>
                  Provider.of<TodoStateController>(context, listen: false)
                      .setTitle(v),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                onPressed: () async {
                  await context.read<TodoStateController>().createTodo();
                  widget.todoBloc.add(GetTodoList());
                  //Navigator.pop(context);
                },
                icon: Icon(Icons.send),
              )),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _res.responseList.length,
              itemBuilder: (c, index) {
                final res = _res.responseList[index];
                return Dismissible(
                  onDismissed: (_) async =>
                      await Provider.of<TodoStateController>(context,
                              listen: false)
                          .deleteTodo(res.id),
                  key: Key(res.id),
                  child: CheckboxListTile(
                    value: res.isDone,
                    onChanged: (v) {},
                    // (isDone) => Provider.of<TodoStateController>(context)
                    // .updateTodo(res.id, !res.isDone),
                    title: Text(res.todo),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
