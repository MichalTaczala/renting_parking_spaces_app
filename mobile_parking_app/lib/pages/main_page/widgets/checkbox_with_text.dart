import 'package:flutter/material.dart';

class CheckboxWithText extends StatelessWidget {
  const CheckboxWithText(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.text});
  final ValueChanged<bool?> onChanged;
  final bool value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: value,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}
