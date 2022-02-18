import 'package:bloc_arch_test/todo/model/todo_model/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class APIClient {
  final _db = FirebaseFirestore.instance.collection('todos');
  Future<void> createData(String todo) async {
    final data = TodoModel(todo: todo).toJson();
    await _db.add(data);
  }

  Future<List<TodoModel>> retrieveData() async {
    final data = await _db.get();
    final docs = data.docs;
    return docs.map((e) => TodoModel.fromJson(e.data())).toList();
  }

  Future<void> updateData(String id, bool isDone) async {
    final data = const TodoModel().copyWith(isDone: isDone).toJson();
    await _db.doc(id).update(data);
  }

  Future<void> deleteData(String id) async {
    await _db.doc(id).delete();
  }
}
