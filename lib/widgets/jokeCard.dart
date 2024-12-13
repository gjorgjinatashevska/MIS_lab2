import 'package:flutter/material.dart';
import '../models/jokeModel.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;

  const JokeCard({Key? key, required this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(joke.punchline, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
