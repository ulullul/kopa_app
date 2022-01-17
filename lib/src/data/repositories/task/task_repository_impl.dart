import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/src/domain/models/task_model.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final firestoreTaskData = FirebaseFirestore.instance.collection('taskData');

  /// ===== добавление задачи ===
  @override
  Stream<List<Task>> getTaskList(String uid) {
    return firestoreTaskData.where("userId", isEqualTo: uid).snapshots().map((event) {
      return event.docs.map((e) {
        print(e.id);
        return Task.fromJSON(e.data(), e.id);
      }).toList();
    });
  }

  /// ===== удаление задачи ===
  @override
  Future<void> deleteTask(Task item) => firestoreTaskData.doc(item.id).delete();

  /// ===== удаление всего списка ==
  @override
  Future<void> deleteListTask() async {
    var batch = FirebaseFirestore.instance.batch();
    var allTasks = await firestoreTaskData
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    for (var value in allTasks.docs) {
      batch.delete(firestoreTaskData.doc(value.id));
    }
    await batch.commit();
  }
}
