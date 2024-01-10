import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonOutLine extends ConsumerStatefulWidget {
  final void Function()? onPress;
  final String textButton;
  const ButtonOutLine(
      {super.key, required this.onPress, required this.textButton});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonOutLineState();
}

class _ButtonOutLineState extends ConsumerState<ButtonOutLine> {
  @override
  Widget build(BuildContext context) {
    final String textButton = widget.textButton;
    void Function()? onPress = widget.onPress;
    final Color colorBorderButton = Theme.of(context).colorScheme.secondary;
    final Color colorText = Theme.of(context).colorScheme.onSurface;
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16)),
        side: MaterialStateProperty.all(
          BorderSide(
              color: colorBorderButton, width: 1.0, style: BorderStyle.solid),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      onPressed: onPress,
      child: Text(
        textButton,
        style: GoogleFonts.inter(
          textStyle: TextStyle(color: colorText, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
