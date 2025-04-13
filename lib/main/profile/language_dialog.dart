// Dialog untuk memilih bahasa
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/language_provider.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: ['English', 'Indonesian', 'Spanish'].map((language) {
        return RadioListTile(
          title: Text(language),
          value: language,
          groupValue: Provider.of<LanguageProvider>(context).language,
          onChanged: (value) {
            Provider.of<LanguageProvider>(context, listen: false).language = value.toString();
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}
