import 'package:fablab_helper/utils/layout.dart';
import 'package:flutter/material.dart';

class FabLabAppBar extends StatelessWidget {
  const FabLabAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(
          'FABLAB',
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: kGapSmall,
        ),
        Chip(
          padding: EdgeInsets.zero,
          backgroundColor: theme.primaryColor,
          side: BorderSide.none,
          label: Text(
            'HELPER',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const Spacer(),
        Icon(
          Icons.info_rounded,
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
