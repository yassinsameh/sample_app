import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:innoscripta_demo/core/component_widgets/loading.dart';
import 'package:innoscripta_demo/core/data_source/authentication.dart';
import 'package:innoscripta_demo/core/errors/screens/general_error.dart';
import 'package:innoscripta_demo/core/theme/theme.dart';
import 'package:innoscripta_demo/tasks_feature/screens/status_page.dart';
import 'package:innoscripta_demo/tasks_feature/screens/task_details.dart';
import 'package:innoscripta_demo/tasks_feature/tasks_notifier.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theme/palette.dart';
import '../../core/theme/shapes.dart';
import '../models/task_status.dart';

class Home extends ConsumerStatefulWidget {
  static const path = "home";
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  late final PageController _pageController;
  late final List<Widget> statusPages;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    statusPages = _buildStatusesPages();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildStatusesPages() {
    return TaskStatus.values
        .map((e) => StatusPage(
              status: e,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Innoscripta",
          style: AppThemeData.themeData.textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(TaskDetails.path);
        },
        backgroundColor: Palette.primaryColor1,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ref.watch(tasksProvider).allTasks.when(
                  data: (todos) {
                    return PageView(
                      controller: _pageController,
                      children: statusPages,
                    );
                  },
                  error: (error, stack) => const GeneralError(),
                  loading: () => const LoadingIndicator())),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
              controller: _pageController,
              // PageController
              count: 3,
              effect: JumpingDotEffect(
                  activeDotColor: Palette.primaryColor1,
                  dotColor: Palette.primaryColor1
                      .withOpacity(0.2)), // your preferred effect
              onDotClicked: (index) {}),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
