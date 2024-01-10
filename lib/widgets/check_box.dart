import 'package:flutter/material.dart';

class CheckBoxAssignment extends StatefulWidget {
  final int colorCheckBox;
  final bool isFinish;

  const CheckBoxAssignment(
      {Key? key, required this.isFinish, required this.colorCheckBox})
      : super(key: key);

  @override
  State<CheckBoxAssignment> createState() => _CheckBoxAssignmentState();
}

class _CheckBoxAssignmentState extends State<CheckBoxAssignment> {
  bool isFinish = false;

  @override
  void initState() {
    super.initState();
    isFinish = widget.isFinish;
  }

  @override
  Widget build(BuildContext context) {
    final int colorCheckBox = widget.colorCheckBox;
    final Color backgroundCheckBox = Theme.of(context).colorScheme.onPrimary;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return isFinish ? Color(colorCheckBox) : backgroundCheckBox;
    }

    return Checkbox(
      checkColor: Colors.black,
      side: const BorderSide(color: Colors.white, width: 1),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      activeColor: Colors.black,
      value: isFinish,
      onChanged: (bool? value) {
        setState(() {
          isFinish = value ?? false;
        });
      },
    );
  }
}
