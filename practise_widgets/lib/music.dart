import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Play Music'),
        ),
      ),
    );
  }
}
