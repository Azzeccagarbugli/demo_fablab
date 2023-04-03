import 'package:fablab_helper/utils/layout.dart';
import 'package:flutter/material.dart';

class SelectionChipFabLab extends StatelessWidget {
  const SelectionChipFabLab({
    super.key,
    required this.data,
    required this.onSelected,
    required this.title,
  });

  final Map<String, bool> data;

  final Function(bool) onSelected;

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
              children: data.keys.map(
                (key) {
                  return ChoiceChip(
                    label: Text(
                      key,
                    ),
                    selected: data[key] != false,
                    onSelected: (bool selected) {
                      onSelected(data.update(
                        key,
                        (_) => selected,
                      ));
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
