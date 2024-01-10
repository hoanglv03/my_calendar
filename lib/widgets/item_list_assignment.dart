import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calendar/models/assignment.dart';
import 'package:my_calendar/widgets/check_box.dart';

class ItemListAssignment extends ConsumerStatefulWidget {
  final Assignment assignment;
  const ItemListAssignment({super.key, required this.assignment});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemListAssignmentState();
}

class _ItemListAssignmentState extends ConsumerState<ItemListAssignment> {
  @override
  Widget build(BuildContext context) {
    final Color colorIconDelete = Theme.of(context).colorScheme.secondary;
    final Color colorTextDescription = Theme.of(context).colorScheme.surface;
    final assignment = widget.assignment;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CheckBoxAssignment(
                colorCheckBox: assignment.color,
                isFinish: assignment.isFinish,
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                assignment.name,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: assignment.isFinish
                          ? TextDecoration.lineThrough
                          : null),
                ),
              ),
            ),
            Expanded(
              child: Icon(
                Icons.delete,
                color: colorIconDelete,
              ),
            )
          ],
        ),
        Text(
          assignment.description ?? "",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: colorTextDescription,
                fontSize: 12,
                decoration:
                    assignment.isFinish ? TextDecoration.lineThrough : null),
          ),
        ),
      ],
    );
  }
}
