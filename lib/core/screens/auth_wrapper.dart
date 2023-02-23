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
  bool signInFailed = false;
  @override
  void initState() {
    Future.microtask(() =>
        ref.read(authDataSource).signInAnonymously().catchError((error, stack) {
          debugPrint("$error, stack: $stack");
          setState(() {
            signInFailed = true;
          });
        }));
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
              if (user != null) {
                Future.microtask(() => context.goNamed(Home.path));
              }
              return signInFailed
                  ? GeneralError(
                      message:
                          "Failed to sign in, please check your internet connection.",
                      onPressed: () async {
                        try {
                          await ref.read(authDataSource).signInAnonymously();
                          setState(() {
                            signInFailed = false;
                          });
                        } catch (e, stack) {
                          debugPrint("Failed: $e,Stack: $stack");
                        }
                      },
                    )
                  : const LoadingIndicator();
            },
            error: (error, stack) => const GeneralError(),
            loading: () => const LoadingIndicator()),
      ),
    );
  }
}
