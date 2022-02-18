import 'package:bloc_arch_test/covid/model/covid_model.dart';
import 'package:equatable/equatable.dart';

abstract class CovidState extends Equatable {
  const CovidState();

  @override
  List<Object?> get props => [];
}

class CovidInitial extends CovidState {}

class CovidLoading extends CovidState {}

class CovidSuccess extends CovidState {
  final CovidModel covidModel;
  const CovidSuccess(this.covidModel);
}

class CovidError extends CovidState {
  final String? message;
  const CovidError(this.message);
}
