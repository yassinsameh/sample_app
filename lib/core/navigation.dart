import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:innoscripta_demo/core/errors/screens/general_error.dart';
import 'package:innoscripta_demo/core/screens/auth_wrapper.dart';
import 'package:innoscripta_demo/tasks_feature/screens/task_details.dart';

import '../tasks_feature/models/task.dart';
import '../tasks_feature/screens/home.dart';

final routerProvider = Provider((ref) {
  return RouterHandler();
});

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

class RouterHandler {
  final GoRouter router;

  RouterHandler()
      : router = GoRouter(
          navigatorKey: globalNavigatorKey,
          initialLocation: "/${AuthWrapper.path}",
          routes: [
            GoRoute(
              path: '/${Home.path}',
              name: Home.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const Home(),
            ),
            GoRoute(
              path: '/${AuthWrapper.path}',
              name: AuthWrapper.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const AuthWrapper(),
            ),
            GoRoute(
                path: '/${TaskDetails.path}',
                name: TaskDetails.path,
                builder: (BuildContext context, GoRouterState state) {
                  final Task? task = state.extra as Task?;
                  return TaskDetails(
                    task: task,
                  );
                }),
          ],
          errorBuilder: (context, state) {
            debugPrint("Routing issue: ${state.error}");
            return const GeneralError();
          },
        );
}
