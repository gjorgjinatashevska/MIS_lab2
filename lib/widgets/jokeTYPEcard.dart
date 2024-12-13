import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String type;
  final VoidCallback onTap;

  const JokeTypeCard({Key? key, required this.type, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(type.toUpperCase()),
        onTap: onTap,
      ),
    );
  }
}
