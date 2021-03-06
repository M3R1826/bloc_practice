import 'package:bloc_arch_test/todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_arch_test/todo/bloc/todo_event/todo_event.dart';
import 'package:bloc_arch_test/todo/bloc/todo_state/todo_state.dart';
import 'package:bloc_arch_test/todo/view/compornent/add_todo_dialog.dart';
import 'package:bloc_arch_test/todo/view/compornent/todo_view.dart';
import 'package:bloc_arch_test/todo/view/state_controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'compornent/loader.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoBloc _todoBloc = TodoBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todoBloc.add(GetTodoList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => _todoBloc.add(GetTodoList())),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TODO's"),
        actions: [
          IconButton(
              onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => AddTodoDialog(todoBloc: _todoBloc)),
              icon: const Icon(Icons.add))
        ],
      ),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => _todoBloc,
          child: BlocListener<TodoBloc, TodoState>(
            listener: (_, state) {
              if (state is TodoError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message.toString())));
              }
            },
          ),
        ),
        ChangeNotifierProvider<TodoStateController>(
            create: (context) => TodoStateController(context)),
      ],
      child: BlocBuilder<TodoBloc, TodoState>(builder: (_, state) {
        return _responseWidget(state);
      }),
    );
  }

  Widget _responseWidget(TodoState state) {
    if (state is TodoInitial) {
      return const InitialLoader();
    } else if (state is TodoLoading) {
      return const InitialLoader();
    } else if (state is TodoSuccess) {
      return TodoView(
        list: state.todoModel,
        todoBloc: _todoBloc,
      );
    } else if (state is TodoError) {
      return Container();
    } else {
      return Container();
    }
  }
}
