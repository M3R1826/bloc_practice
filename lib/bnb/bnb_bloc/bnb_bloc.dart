import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bnb_state.dart';

class BNBBloc extends Bloc<BNBEvent, BNBState> {
  BNBBloc() : super(BNBInitial());

  int index = 0;

  @override
  Stream<BNBState> mapEventToState(BNBEvent event) async* {
    yield BNBLoading();
    if (event is BaseBNBEvent) {
      try {
        index = event.index;
        yield BNBSuccess();
      } catch (e) {
        yield const BNBError("error");
      }
    } else if (event is BNBFirstEvent) {
      yield BNBFirst();
    } else if (event is BNBSecondEvent) {
      yield BNBSecond();
    } else if (event is BNBThirdEvent) {
      yield BNBThird();
    }
  }
}
