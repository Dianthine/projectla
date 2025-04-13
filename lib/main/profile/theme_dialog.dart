import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: ['Light', 'Dark', 'System Default'].map((theme) {
        return RadioListTile(
          title: Text(theme),
          value: theme,
          groupValue: Provider.of<ThemeProvider>(context).theme,
          onChanged: (value) {
            Provider.of<ThemeProvider>(context, listen: false).theme = value.toString();
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}
