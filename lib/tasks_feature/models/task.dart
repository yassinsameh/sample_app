import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:innoscripta_demo/tasks_feature/models/task_status.dart';

import '../../core/utils/models.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Task({
    @JsonKey(includeToJson: false) required String id,
    @TimestampConverter() DateTime? completedTime,
    required String createdBy,
    required String title,
    //Number of seconds
    required int timeSpent,
    required TaskStatus status,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
