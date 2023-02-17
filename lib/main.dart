import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation.dart';
import 'core/theme/theme.dart';
import 'core/data_source/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Lock to portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProviderSingleton = ref.watch(routerProvider);

    return MaterialApp.router(
        title: 'Innoscripta Demo',
        routeInformationParser:
            routerProviderSingleton.router.routeInformationParser,
        routeInformationProvider:
            routerProviderSingleton.router.routeInformationProvider,
        routerDelegate: routerProviderSingleton.router.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.themeData);
  }
}
