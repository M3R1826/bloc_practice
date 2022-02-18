import 'package:bloc_arch_test/todo/bloc/todo_event/todo_event.dart';
import 'package:bloc_arch_test/todo/bloc/todo_state/todo_state.dart';
import 'package:bloc_arch_test/todo/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();
  TodoBloc() : super(TodoInitial()) {
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
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    yield TodoLoading();
    if (event is GetTodoList) {
      try {
        final data = await _repository.retrieveData();
        yield TodoSuccess(data);
      } catch (e) {
        yield const TodoError("Failed to fetch data. is your device online?");
      }
    }
  }
}
