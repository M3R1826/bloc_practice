import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CStateController extends ChangeNotifier {
  CStateController(this.context);
  final controller = ScrollController();
  final BuildContext context;
  late final BNBBloc bloc = context.read();
}
