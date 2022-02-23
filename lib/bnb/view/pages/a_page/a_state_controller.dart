import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_bloc.dart';
import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

class AStateController extends ChangeNotifier {
  AStateController(this.context);

  final controller = ScrollController(initialScrollOffset: 0);
  final BuildContext context;
  late final BNBBloc bloc = context.read();
}
