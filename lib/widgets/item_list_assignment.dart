import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final assignment = widget.assignment;
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CheckBoxAssignment(),
            )
          ],
        )
      ],
    );
  }
}
