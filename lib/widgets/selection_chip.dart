import 'package:fablab_helper/utils/layout.dart';
import 'package:flutter/material.dart';

class SelectionChipFabLab extends StatelessWidget {
  const SelectionChipFabLab({
    super.key,
    required this.start,
    required this.onSelected,
    required this.title,
  });

  final Map<String, int?> start;

  final Function(bool, String) onSelected;

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(kGapLarge),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(height: kGapMedium),
            Wrap(
              spacing: kGapMedium,
              children: start.keys.map(
                (String key) {
                  return ChoiceChip(
                    label: Text(
                      key,
                    ),
                    selected: start[key] != null,
                    onSelected: (bool selected) {
                      onSelected(selected, key);
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
