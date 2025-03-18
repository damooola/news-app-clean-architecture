import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DailyNews(),
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
