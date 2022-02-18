import 'package:bloc_arch_test/todo/view/state_controller/state_controller.dart';
import 'package:bloc_arch_test/todo/view/todo_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MultiProvider(
        child: const MaterialApp(home: TodoPage()),
        providers: [
          ChangeNotifierProvider<TodoStateController>(
              create: (_) => TodoStateController())
        ],
      );
}
