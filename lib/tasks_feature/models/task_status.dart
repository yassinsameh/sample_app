import 'package:freezed_annotation/freezed_annotation.dart';

enum TaskStatus{
  @JsonValue("todo")todo,
  @JsonValue("inProgress")inProgress,
  @JsonValue("done")done
}

extension TaskStatusExtension on TaskStatus {

  String get name {
    switch (this) {
      case TaskStatus.todo:
        return 'Todo';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
      default:
        return 'Todo';
    }
  }
}