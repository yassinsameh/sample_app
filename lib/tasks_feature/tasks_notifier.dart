import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_demo/core/errors/messages.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_service.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_state.dart';

import 'models/task.dart';
import 'models/task_status.dart';

final tasksProvider =
    StateNotifierProvider.autoDispose<TasksNotifier, TasksState>((ref) {
  final tasksService = ref.watch(tasksServiceProvider);
  return TasksNotifier(const TasksState(allTasks: AsyncLoading()), tasksService)
    ..watchTasks();
});

class TasksNotifier extends StateNotifier<TasksState> {
  final TasksService _tasksService;
  TasksNotifier(TasksState state, this._tasksService) : super(state);

  void watchTasks() {
    try {
      _tasksService.fetchTasks().listen((tasks) {
        state = state.copyWith(allTasks: AsyncValue.data(tasks));
      }, onError: (e, stack) {
        state = state.copyWith(allTasks: AsyncError(e, stack));
      });
    } catch (e, stack) {
      state = state.copyWith(allTasks: AsyncError(e, stack));
    }
  }

  Future<void> updateTask(
      {required Task task, bool markCompleteNow = false}) async {
    try {
      if (markCompleteNow) {
        task = task.copyWith(completedTime: DateTime.now());
      }
      await _tasksService.updateTask(task: task);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> addTask({required String title}) async {
    try {
      ///Create empty task
      final newTask = Task(
          id: "",
          title: title,
          timeSpent: 0,
          status: TaskStatus.todo,
          completedTime: null,
          createdBy: "");
      await _tasksService.addTask(task: newTask);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> updateTaskTimer(
      {required Task task, required bool newValue}) async {
    try {
      Map<String, int> tasksOn = {...state.tasksWithTimerOn};

      ///If turning on
      if (newValue) {
        tasksOn[task.id] = task.timeSpent;
        state = state.copyWith(tasksWithTimerOn: tasksOn);
        return;
      }

      ///Turning off
      final taskTotalTime = state.tasksWithTimerOn[task.id] ?? task.timeSpent;
      task = task.copyWith(timeSpent: taskTotalTime);
      tasksOn.remove(task.id);
      state = state.copyWith(tasksWithTimerOn: tasksOn);

      await updateTask(task: task);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  void updateAllOnTasks() {
    Map<String, int> tasksOn = {...state.tasksWithTimerOn};
    if (tasksOn.isEmpty) return;
    tasksOn.forEach((key, value) {
      tasksOn[key] = ++value;
    });
    state = state.copyWith(tasksWithTimerOn: tasksOn);
  }

  Future<void> deleteTask({required String id}) async {
    try {
      await _tasksService.deleteTask(id: id);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }
}
