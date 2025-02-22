import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calendar/models/task.dart';
import 'package:my_calendar/widgets/button_fill.dart';
import 'package:my_calendar/widgets/button_outline.dart';
import 'package:my_calendar/widgets/list_assignment.dart';

class ItemListTask extends ConsumerStatefulWidget {
  final Task task;
  const ItemListTask({Key? key, required this.task}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListTaskState();
}

class _ItemListTaskState extends ConsumerState<ItemListTask> {
  bool _isExpanded = false;
  bool _isDone1 = false;
  static const double _initHeight = 88;
  static const double _expandedHeight = 400;
  final ExpansionTileController controller = ExpansionTileController();
  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isDone1 = !_isDone1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color colorItem = Theme.of(context).colorScheme.onPrimary;

    final Color colorClass = Theme.of(context).colorScheme.surface;

    final Color colorError = Theme.of(context).colorScheme.error;

    final task = widget.task;

    Color colorTask = Color(task.color);

    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.only(bottom: 16),
        height: _isExpanded ? _expandedHeight : _initHeight,
        decoration: BoxDecoration(
          color: colorItem,
          borderRadius: BorderRadius.circular(5), // Set the borderRadius
        ),
        onEnd: () {
          print("onEnd");
          setState(() {
            _isDone1 = true;
          });
        },
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      Text(
                        task.startTime,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    task.endTime,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: colorItem,
                  border: Border(
                    left: BorderSide(
                      color: colorTask,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: Container(
                        margin: const EdgeInsets.only(top: 2),
                        alignment: Alignment.topLeft,
                        child: Text(
                          task.title,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: colorTask, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              task.idClassName,
                              style: GoogleFonts.inter(
                                textStyle:
                                    TextStyle(color: colorClass, fontSize: 13),
                              ),
                            ),
                          ),
                          _isExpanded
                              ? const SizedBox()
                              : SizedBox(
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 5000),
                                    curve: Curves.easeOutSine,
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: colorItem,
                                      border: Border(
                                        left: BorderSide(
                                          color: colorClass,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            color: colorError,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                          ),
                                          child: Text(
                                            "1",
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Missing assignment",
                                            style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    !(_isExpanded)
                        ? const SizedBox()
                        : Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: ListAssignment(
                                  listAssignments: task.listAssignments,
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 3000,
                                      child: ButtonOutLine(
                                        onPress: () {
                                          print("Click");
                                        },
                                        textButton: "Cancel",
                                      ),
                                    ),
                                    Flexible(
                                      flex: 5000,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: ButtonFill(
                                            onPress: () {
                                              print("object");
                                            },
                                            textButton: "+ Assignment"),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
