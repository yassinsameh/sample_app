import 'package:intl/intl.dart';

abstract class TasksUtils {
  static String intDurationToString({required int timeSpent}) {
    final hours = timeSpent ~/ 3600;
    final minutes = (timeSpent - (hours * 3600)) ~/ 60;
    final seconds = timeSpent % 60;

    final displaySeconds = seconds < 10 ? "0$seconds" : seconds;
    final displayMinutes = minutes < 10 ? "0$minutes" : minutes;
    final displayHours = hours == 0 ? "" : "$hours:";

    return "$displayHours$displayMinutes:$displaySeconds";
  }

  static String dateToTaskDisplayedTime({required DateTime time}) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy | HH:mm');
    final String formatted = formatter.format(time);
    return formatted;
  }
}
