import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_calendar/controller/datetime_controller.dart';
import 'package:my_calendar/models/assignment.dart';
import 'package:my_calendar/models/task.dart';
import 'package:my_calendar/widgets/item_list_task.dart';

class Today extends ConsumerStatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodayState();
}

class _TodayState extends ConsumerState<Today> {
  @override
  Widget build(BuildContext context) {
    const errorColor = Color(0xFFFE7171);
    const countTasks = "1";
    final Color activeTextColor = Theme.of(context).colorScheme.primary;
    final Color inactiveTextColor =
        Theme.of(context).colorScheme.secondaryContainer;
    final Color activeLabelColor = Theme.of(context).colorScheme.onBackground;

    //create data test
    Assignment assignment1 = Assignment(
        "Assignment", true, 1, null, "Assignment Des", "11:30 AM", 0xFFFE7171);
    Assignment assignment2 = Assignment("Assignment2", false, 1, null,
        "Assignment Des", "11:30 AM", 0xFFFE7171);
    Assignment assignment3 = Assignment("Assignment2", false, 1, null,
        "Assignment Des", "11:30 AM", 0xFFFE7171);
    Assignment assignment4 = Assignment("Assignment2", false, 1, null,
        "Assignment Des", "11:30 AM", 0xFFFE7171);
    List<Task> listTask = [];
    listTask.add(Task(
        1,
        "EC 203 - Principles Macroeconomics",
        "10:30 AM",
        "11:30 AM",
        "Room 101",
        0xFFFE7171,
        [assignment1, assignment2, assignment3, assignment4],
        true));
    listTask.add(Task(2, "MGT 101 - Organization Management", "10:30 AM",
        "11:30 AM", "Room 102", 0xFFFE7171, [assignment2], false));

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: activeLabelColor,
            height: 100,
            padding: const EdgeInsets.only(bottom: 10),
            child: EasyDateTimeLine(
              locale: "vi_VN",
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                ref
                    .read(dateTimeControllerProvider.notifier)
                    .setDateTime(selectedDate);
              },
              headerProps: const EasyHeaderProps(
                selectedDateFormat: SelectedDateFormat.fullDateMDY,
                monthPickerType: MonthPickerType.switcher,
                showMonthPicker: false,
                showHeader: false,
              ),
              dayProps: const EasyDayProps(
                height: 90,
                width: 55,
              ),
              itemBuilder: (BuildContext context, String dayNumber, dayName,
                  monthName, fullDate, isSelected) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  height: 85,
                  width: 55,
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: isSelected
                        ? [
                            const BoxShadow(
                              color: Colors.blue,
                              spreadRadius: 2,
                              blurRadius: 4,
                              blurStyle: BlurStyle.inner,
                              offset:
                                  Offset(2, 4), // changes position of shadow
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayNumber,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected ? activeTextColor : inactiveTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        dayName,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isSelected ? activeTextColor : inactiveTextColor,
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: const BoxDecoration(
                          color: errorColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: const Text(
                          countTasks,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listTask.length,
              shrinkWrap: false,
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return ItemListTask(task: listTask[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
