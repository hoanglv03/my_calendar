import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFill extends ConsumerStatefulWidget {
  final void Function()? onPress;
  final String textButton;
  const ButtonFill(
      {super.key, required this.onPress, required this.textButton});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonFillState();
}

class _ButtonFillState extends ConsumerState<ButtonFill> {
  @override
  Widget build(BuildContext context) {
    final String textButton = widget.textButton;
    void Function()? onPress = widget.onPress;
    final Color backgroundButton = Theme.of(context).colorScheme.secondary;
    final Color colorTextButton = Theme.of(context).colorScheme.onBackground;

    return ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16)),
          backgroundColor: MaterialStateProperty.all(backgroundButton),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        child: Text(
          textButton,
          style: GoogleFonts.inter(
            textStyle:
                TextStyle(color: colorTextButton, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
