import 'package:flutter/material.dart';

import 'screens/input_page.dart';
import 'screens/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0XFF0A0E21)),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: InputPage.id,
      routes: {
        InputPage.id: (context) => const InputPage(),
        ResultPage.id: (context) => const ResultPage(),
      },
    );
  }
}
