import 'package:flutter/material.dart';

// 🍎 Details Page
class DetailsPage extends StatelessWidget {
  final String fruitName;

  const DetailsPage({super.key, required this.fruitName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fruitName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You selected $fruitName',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to About Page'),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/about");
                // Navigate to About Page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const AboutPage()),
                // );
              },
            ),
            const SizedBox(height: 11),
            ElevatedButton(
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
