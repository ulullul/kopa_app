import 'package:flutter_app_example/src/domain/models/task_model.dart';
import 'package:flutter_app_example/src/core/data/base_repository.dart';

abstract class TaskRepository extends BaseRepository {
//  static TaskRepository get to => Get.find();

  /// ===== добавление задачи ===
  Stream<List<Task>> getTaskList(String uid);

  /// ===== удаление задачи ===
  Future<void> deleteTask(Task item);

  /// ===== удаление всего списка ====
  Future<void> deleteListTask();
}
