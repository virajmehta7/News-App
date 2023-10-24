import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/color_scheme.dart';
import 'package:news/tab_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((dynamicLight, dynamicDark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: dynamicLight ?? light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: dynamicDark ?? dark,
          ),
          themeMode: ThemeMode.system,
          home: const TabView(),
        );
      }),
    );
  }
}
