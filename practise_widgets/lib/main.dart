import 'package:flutter/material.dart';
import 'package:practise_widgets/home_page.dart';
import 'package:practise_widgets/music.dart';
import 'package:practise_widgets/next_page.dart';
import 'package:practise_widgets/setting.dart';

void main() {
  runApp(const MyApp());
}

int index = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/settings': (context) => Settings(),
        '/music': (context) => const Music(),
        '/next': (context) => const NextPage(),
      },

      home: const Homepage(),
    );
  }
}
