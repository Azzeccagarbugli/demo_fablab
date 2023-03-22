import 'package:fablab_helper/utils/layout.dart';
import 'package:flutter/material.dart';

class TextFieldFabLab extends StatelessWidget {
  const TextFieldFabLab({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(kGapLarge),
        child: TextField(
          onChanged: onChanged,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'What else do you need?',
          ),
        ),
      ),
    );
  }
}
