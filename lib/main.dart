import 'package:bloc_arch_test/todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_arch_test/todo/view/state_controller/state_controller.dart';
import 'package:bloc_arch_test/todo/view/todo_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bnb/bnb_bloc/bnb_bloc.dart';
import 'bnb/view/bnb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<TodoStateController>(
              create: (context) => TodoStateController(context)),
          BlocProvider<TodoBloc>(create: (_) => TodoBloc()),
          BlocProvider<BNBBloc>(create: (_) => BNBBloc()),
        ],
        child: const MaterialApp(home: BNBPage()),
      );
}
