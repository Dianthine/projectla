import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'main/profile/providers/theme_provider.dart';
import 'main/profile/providers/language_provider.dart';
import 'main/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return MaterialApp(
          title: 'Flutter Profile Page',
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          locale: languageProvider.currentLocale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('id', 'ID'),
            Locale('es', 'ES'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const HomePage(),
        );
      },
    );
  }
}