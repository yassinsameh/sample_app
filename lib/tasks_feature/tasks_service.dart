import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_demo/core/errors/messages.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_datasource.dart';

import '../core/data_source/utils.dart';
import 'models/task.dart';

final tasksServiceProvider = Provider.autoDispose((ref) {
  final datasource = ref.watch(tasksDataSourceProvider);
  return TasksService(datasource);
});

class TasksService {
  final TasksDataSource _todosDataSource;

  TasksService(this._todosDataSource);

  Stream<List<Task>> fetchTasks() {
    try {
      final result = _todosDataSource.watchUserTasks();
      List<Task> tasks = [];
      return result.map((snapshot) {
        tasks = snapshot.docs
            .map((e) => Task.fromJson(
                DataSourceUtils.mergeDataWithId(id: e.id, json: e.data())))
            .toList();
        return tasks;
      });
    } catch (e) {
      throw ("Failed to fetch tasks");
    }
  }

  Future<void> updateTask({required Task task}) async {
    try {
      await _todosDataSource.updateTask(task: task);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> addTask({required Task task}) async {
    try {
      await _todosDataSource.addTask(task: task);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> deleteTask({required String id}) async {
    try {
      await _todosDataSource.deleteTask(id: id);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }
}
