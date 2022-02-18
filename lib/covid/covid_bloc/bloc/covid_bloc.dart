import 'package:bloc_arch_test/covid/covid_bloc/event/covid_event.dart';
import 'package:bloc_arch_test/covid/covid_bloc/state/covid_state.dart';
import 'package:bloc_arch_test/covid/repository/covid_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final ApiRepository _apiRepository = ApiRepository();
  CovidBloc() : super(CovidInitial()) {
    /// flutter_bloc 8.0.0以降でmajorRelease
    // on<GetCovidList>((event, emit) async {
    //   emit(CovidLoading());
    //   try {
    //     final mList = await _apiRepository.fetchCovidList();
    //     emit(CovidLoaded(mList));
    //     if (mList.error != null) {
    //       emit(CovidError(mList.error));
    //     }
    //   } on NetworkError {
    //     emit(const CovidError("Failed to fetch data. is your device online?"));
    //   }
    // });
  }

  ///
  /// flutter_bloc 7.0.0までで使用可能
  /// flutter_bloc 8.0.0以降はon(上部のConstructor内メソッド)を使用
  ///
  @override
  Stream<CovidState> mapEventToState(CovidEvent event) async* {
    yield CovidLoading();
    if (event is GetCovidList) {
      try {
        final data = await _apiRepository.fetchCovidList();
        yield CovidSuccess(data);
      } catch (e) {
        yield const CovidError("Failed to fetch data. is your device online?");
      }
    } else {
      try {
        final data = await _apiRepository.fetchCovidList();
        data.countries = data.countries?..shuffle();
        yield CovidSuccess(data);
      } catch (e) {
        yield const CovidError("Failed to fetch data. is your device online?");
      }
    }
  }
}
