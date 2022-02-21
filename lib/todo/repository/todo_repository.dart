import 'package:bloc_arch_test/todo/api_client/api_client.dart';
import 'package:bloc_arch_test/todo/model/response_model/response_model.dart';

class TodoRepository {
  final _api = APIClient();

  Future<ResponseModel> createData(String todo) async {
    await _api.createData(todo);
    final res = await retrieveData();
    return res;
  }

  Future<ResponseModel> retrieveData() async {
    final data = await _api.retrieveData();
    return const ResponseModel().copyWith(responseList: data);
  }

  Future<void> updateData(String id, bool isDone) async =>
      await _api.updateData(id, isDone);
  Future<void> deleteData(String id) async => await _api.deleteData(id);
}
