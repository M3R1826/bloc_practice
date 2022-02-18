import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'covid/covid_bloc/bloc/covid_bloc.dart';
import 'covid/page/covid_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (BuildContext context) => CovidBloc(),
      child: const MaterialApp(home: CovidPage()));
}
