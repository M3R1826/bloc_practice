import 'package:equatable/equatable.dart';

abstract class BNBEvent extends Equatable {
  const BNBEvent();

  @override
  List<Object> get props => [];
}

class BaseBNBEvent extends BNBEvent {
  const BaseBNBEvent({required this.index});
  final int index;
}

class BNBFirstEvent extends BNBEvent {
  const BNBFirstEvent();
}

class BNBSecondEvent extends BNBEvent {
  const BNBSecondEvent();
}

class BNBThirdEvent extends BNBEvent {
  const BNBThirdEvent();
}
