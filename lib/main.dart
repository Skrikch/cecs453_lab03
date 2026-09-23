// Authors: Christos Georgakopoulos, Britney Ferguson
import 'package:flutter/material.dart';

void main() {
  runApp(const AffirmationsApp());
}

// Creating an "Affirmation" class to represent the contents of our cards
class Affirmation {
  final String text;
  final String imageAsset;

  const Affirmation({required this.text, required this.imageAsset});
}

// Our main app, this is what main executes runApp on :)
class AffirmationsApp extends StatelessWidget {
  const AffirmationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // No title this time because I'm pretty sure that the AppBar overwrites it
      home: AffirmationsScreen(),
    );
  }
}

// Main screen of our app, stateless widget, gets fed into the build
class AffirmationsScreen extends StatelessWidget {
  const AffirmationsScreen({super.key});

  final List<Affirmation> affirmations = const [
    Affirmation(text: "My schemes are masterful", imageAsset: "assets/rat_fist.webp"),
    Affirmation(text: "I am safe, loved, and cared for", imageAsset: "assets/take_care.jpeg"),
    Affirmation(text: "It's okay to treat yourself once in a while", imageAsset: "assets/snack.jpg"),
    Affirmation(text: "My only limits are those I put on myself", imageAsset: "assets/greener_grass.jpeg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Britney and Christos' Affirmations"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // Here's the most important part, our ListView.builder, it constructs
      // Our scrollable list
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final affirmation = affirmations[index];
          // Populating the ListView with a List<affirmations>
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            color: Colors.white24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  affirmation.imageAsset,
                  height: 220,
                  //fit:
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(affirmation.text, style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
