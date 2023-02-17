import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:innoscripta_demo/core/component_widgets/input_field.dart';
import 'package:innoscripta_demo/core/component_widgets/snackbar.dart';
import 'package:innoscripta_demo/core/navigation.dart';
import 'package:innoscripta_demo/core/theme/theme.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_notifier.dart';

import '../../core/component_widgets/primary_button.dart';
import '../../core/theme/palette.dart';
import '../../core/theme/shapes.dart';
import '../models/task.dart';

class TaskDetails extends ConsumerStatefulWidget {
  static const path = "task-details";

  final Task? task;

  const TaskDetails({this.task, Key? key}) : super(key: key);

  @override
  TaskDetailsState createState() => TaskDetailsState();
}

class TaskDetailsState extends ConsumerState<TaskDetails> {
  late Task? task;
  late TextEditingController titleController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void initState() {
    task = widget.task;
    titleController = TextEditingController();
    if (task != null) {
      titleController.text = task!.title;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = task != null ? "Task details" : "Create Task";

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Shapes.screenHorizontalPadding),
          child: BackButton(
            color: Palette.black1,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          pageTitle,
          style: AppThemeData.themeData.textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Shapes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Title",
                  style: AppThemeData.themeData.textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                controller: titleController,
                closeOnPressed: () {
                  titleController.clear();
                  setState(() {});
                },
                labelText: "Task Title",
                floatingLabelAlignment: FloatingLabelAlignment.start,
                validation: (val) {
                  if (val == null || val.isEmpty || val.length < 5) {
                    return "Min 5 characters required";
                  }
                  return null;
                },
                maxLines: 1,
              ),
              const SizedBox(
                height: 25,
              ),
              const Spacer(),
              if (task != null)
                PrimaryButton(
                  isLoading: loading,
                  buttonColor: Palette.errorColor,
                  borderColor: Palette.errorColor,
                  onPressed: () async {
                    try {
                      if (loading) return;
                      setState(() {
                        loading = true;
                      });
                      await ref
                          .read(tasksProvider.notifier)
                          .deleteTask(id: task!.id);
                      if (!mounted) return;
                      context.pop();
                      Future.delayed(const Duration(milliseconds: 500))
                          .then((value) {
                        AppSnackbar.showSuccessSnackbar(
                            text: "Task has been removed successfully");
                      });
                    } catch (e) {
                      AppSnackbar.showSuccessSnackbar(
                          text: 'Something went wrong, please try again');
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  text: "Delete Task",
                  bottomPadding: 20,
                ),
              PrimaryButton(
                isLoading: loading,
                onPressed: () async {
                  try {
                    if (loading) return;
                    setState(() {
                      loading = true;
                    });
                    if (!(_formKey.currentState?.validate() ?? false)) {
                      //Val errors are shown in UI
                      return;
                    }

                    //Updating
                    if (task != null) {
                      task = task!.copyWith(title: titleController.text.trim());
                      await ref
                          .read(tasksProvider.notifier)
                          .updateTask(task: task!);
                    } //Adding new task
                    else {
                      await ref
                          .read(tasksProvider.notifier)
                          .addTask(title: titleController.text.trim());
                    }

                    Future.delayed(const Duration(milliseconds: 500))
                        .then((value) {
                      AppSnackbar.showSuccessSnackbar(
                          text:
                              "Task has been ${task == null ? "added" : "updated"} successfully");
                    });

                    if (mounted) context.pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong')),
                    );
                  } finally {
                    setState(() {
                      loading = false;
                    });
                  }
                },
                text: task != null ? "Update Task" : "Add task",
                bottomPadding: 0,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
