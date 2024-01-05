import 'package:my_calendar/models/assignment.dart';

class Task {
  int id;
  String title;
  String startTime;
  String endTime;
  String idClassName;
  int color;
  List<Assignment>? listAssignments;
  Task(this.id, this.title, this.startTime, this.endTime, this.idClassName,
      this.color, this.listAssignments);
}
