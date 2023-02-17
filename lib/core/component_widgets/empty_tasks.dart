import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../utils/paths.dart';

class EmptyTasks extends StatelessWidget {
  final String status;
  const EmptyTasks({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          "${AssetsPaths.images}/empty_tasks.png",
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "You currently have no Tasks $status",
            style: AppThemeData.themeData.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
