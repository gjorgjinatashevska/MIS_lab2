import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/jokeModel.dart';
import '../widgets/jokeCard.dart';

class JokeListScreen extends StatelessWidget {
  final String type;

  const JokeListScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeCard(joke: jokes[index]);
              },
            );
          }
        },
      ),
    );
  }
}
