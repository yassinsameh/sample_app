import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:innoscripta_demo/core/component_widgets/loading.dart';
import 'package:innoscripta_demo/core/data_source/authentication.dart';
import 'package:innoscripta_demo/core/errors/screens/general_error.dart';

import '../../tasks_feature/screens/home.dart';
import '../theme/palette.dart';

class AuthWrapper extends ConsumerStatefulWidget {
  static const path = "root";
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends ConsumerState<AuthWrapper> {
  @override
  void initState() {
    Future.microtask(() => ref.read(authDataSource).signInAnonymously());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: ref.watch(authStateChangesProvider).when(
            data: (user) {
              Future.microtask(() => context.goNamed(Home.path));
              return const LoadingIndicator();
            },
            error: (error, stack) => const GeneralError(),
            loading: () => const LoadingIndicator()),
      ),
    );
  }
}
