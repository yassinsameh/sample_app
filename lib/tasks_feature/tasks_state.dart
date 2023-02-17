import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    @Default(AsyncValue.loading()) AsyncValue allTasks,
    @Default({}) Map<String, int> tasksWithTimerOn,
  }) = _TasksState;
}
