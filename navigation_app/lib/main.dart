import 'package:flutter/material.dart';
import 'package:navigation_app/pages/about.dart';
import 'package:navigation_app/pages/details.dart';
import 'package:navigation_app/pages/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => const HomePage(),
        '/details': (context) => DetailsPage(
          fruitName: ModalRoute.of(context)!.settings.arguments as String,
        ),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
