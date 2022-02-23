import 'package:bloc_arch_test/todo/model/response_model/response_model.dart';
import 'package:equatable/equatable.dart';

abstract class BNBState extends Equatable {
  const BNBState();

  @override
  List<Object?> get props => [];
}

class BNBInitial extends BNBState {}

class BNBLoading extends BNBState {}

class BNBSuccess extends BNBState {
  const BNBSuccess();
}

class BNBFirst extends BNBState {
  const BNBFirst();
}

class BNBSecond extends BNBState {
  const BNBSecond();
}

class BNBThird extends BNBState {
  const BNBThird();
}

class BNBError extends BNBState {
  final String? message;
  const BNBError(this.message);
}
