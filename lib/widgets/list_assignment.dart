import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calendar/models/assignment.dart';
import 'package:my_calendar/screens/assignments.dart';
import 'package:my_calendar/widgets/button_outline.dart';
import 'package:my_calendar/widgets/item_list_assignment.dart';

class ListAssignment extends ConsumerStatefulWidget {
  final List<Assignment>? listAssignments;

  const ListAssignment({Key? key, this.listAssignments}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListAssignmentState();
}

class _ListAssignmentState extends ConsumerState<ListAssignment> {
  @override
  Widget build(BuildContext context) {
    final listAssignments = widget.listAssignments;
    final Color colorError = Theme.of(context).colorScheme.error;
    final Color colorPrimary = Theme.of(context).colorScheme.primary;
    final Color colorWhite = Theme.of(context).colorScheme.onSurface;
    const String textLocalAssignment = "Assignment";
    const String textLocalAssignmentMissCount = "1";

    return Column(
      children: [
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  textLocalAssignment,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: colorWhite, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: colorError,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Text(
                  textLocalAssignmentMissCount,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(color: colorPrimary, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: listAssignments?.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemListAssignment(assignment: listAssignments![index]);
            },
          ),
        ),
      ],
    );
  }
}
