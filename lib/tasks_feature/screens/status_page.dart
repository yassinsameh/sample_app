import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:innoscripta_demo/core/component_widgets/empty_tasks.dart';
import 'package:innoscripta_demo/core/component_widgets/general_button.dart';
import 'package:innoscripta_demo/core/theme/theme.dart';
import 'package:innoscripta_demo/core/utils/paths.dart';
import 'package:innoscripta_demo/tasks_feature/models/task.dart';
import 'package:innoscripta_demo/tasks_feature/models/task_status.dart';
import 'package:innoscripta_demo/tasks_feature/screens/task_details.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_notifier.dart';
import 'package:innoscripta_demo/tasks_feature/utils.dart';

import '../../core/theme/palette.dart';
import '../../core/theme/shapes.dart';

class StatusPage extends ConsumerStatefulWidget {
  final TaskStatus status;
  const StatusPage({required this.status, Key? key}) : super(key: key);

  @override
  StatusPageState createState() => StatusPageState();
}

class StatusPageState extends ConsumerState<StatusPage>
    with AutomaticKeepAliveClientMixin {
  Timer? timer;

  @override
  void initState() {
    if (widget.status == TaskStatus.inProgress) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
        ref.read(tasksProvider.notifier).updateAllOnTasks();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  List<Widget> _buildMarkingButtons(
      {required Task task, required TaskStatus currentStatus}) {
    List<TaskStatus> allStatuses = TaskStatus.values;
    return List.generate(allStatuses.length, (index) {
      final status = allStatuses[index];
      if (status == currentStatus) return const SizedBox();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: GeneralButton(
            backgroundColor: Palette.whiteText,
            onPressed: () {
              ref.read(tasksProvider.notifier).updateTask(
                  task: task.copyWith(status: status),
                  markCompleteNow: status == TaskStatus.done ? true : false);
            },
            text: "Mark ${status.name}"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Task> allTasks = ref.watch(tasksProvider).allTasks.asData!.value;
    final filteredTasks =
        allTasks.where((element) => element.status == widget.status).toList();
    if (widget.status == TaskStatus.done) {
      filteredTasks
          .sort((a, b) => a.completedTime!.compareTo(b.completedTime!));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Shapes.screenHorizontalPadding),
      child: Column(
        children: [
          Text(
            "Tasks ${widget.status.name}",
            style: AppThemeData.themeData.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: filteredTasks.isEmpty
                  ? EmptyTasks(status: widget.status.name)
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredTasks.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final Task task = filteredTasks[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(TaskDetails.path, extra: task);
                          },
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Shapes.taskBorderRadius)),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Palette.taskBackground,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(Shapes.taskBorderRadius)),
                              ),
                              // shadowColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Shapes.taskHorizontalPadding,
                                    vertical: Shapes.taskVerticalPadding),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          filteredTasks[index].title,
                                          style: AppThemeData
                                              .themeData.textTheme.bodyLarge,
                                        )),
                                        const Icon(Icons.watch_later_outlined),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(TasksUtils.intDurationToString(
                                            timeSpent: ref
                                                        .watch(tasksProvider)
                                                        .tasksWithTimerOn[
                                                    task.id] ??
                                                task.timeSpent)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        if (task.status ==
                                            TaskStatus.inProgress)
                                          Row(
                                            children: [
                                              Switch(
                                                value: ref
                                                            .watch(tasksProvider)
                                                            .tasksWithTimerOn[
                                                        task.id] !=
                                                    null,
                                                onChanged: (value) {
                                                  ref
                                                      .read(tasksProvider
                                                          .notifier)
                                                      .updateTaskTimer(
                                                          task: task,
                                                          newValue: value);
                                                },
                                                activeTrackColor: Palette
                                                    .primaryColor1
                                                    .withOpacity(0.2),
                                                activeColor:
                                                    Palette.primaryColor1,
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Spacer(),
                                        ..._buildMarkingButtons(
                                            task: task,
                                            currentStatus: widget.status)
                                      ],
                                    ),
                                    if (task.completedTime != null)
                                      Text(
                                        "Completed on: \n${TasksUtils.dateToTaskDisplayedTime(time: task.completedTime!)}",
                                        style: AppThemeData
                                            .themeData.textTheme.bodySmall,
                                      )
                                  ],
                                ),
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
