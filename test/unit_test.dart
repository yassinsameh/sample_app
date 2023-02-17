import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta_demo/tasks_feature/models/task.dart';
import 'package:innoscripta_demo/tasks_feature/models/task_status.dart';

void main() {
  group("Task Serialization", () {
    test("Task to json doesn't contain id", () {
      const Task task = Task(
          id: "1",
          createdBy: "3",
          title: "Sample",
          timeSpent: 0,
          status: TaskStatus.done);
      final json = task.toJson();
      expect(json.containsKey("id"), false);
    });
    test("Task serializes fromJson when given map with non empty Id", () {
      final json = {
        "id": "1",
        "created_by": "3",
        "title": "Sample",
        "time_spent": 0,
        "status": "todo",
      };
      final Task task = Task.fromJson(json);
      expect(task.id, isNotEmpty);
    });
  });
}
