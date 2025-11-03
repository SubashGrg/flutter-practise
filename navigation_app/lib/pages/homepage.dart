import 'package:flutter/material.dart';

// 🏠 Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> items = const ['Apple', 'Banana', 'Mango'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fruits List'), centerTitle: true),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, "/details", arguments: items[index]);
              // Go to Details Page and pass fruit name
              // Navigator.push(
              //    context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsPage(fruitName: items[index]),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
