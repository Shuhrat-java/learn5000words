import 'package:flutter/material.dart';

void main() {
  runApp(PlayingWithFlutter());
}

class PlayingWithFlutter extends StatelessWidget {
  const PlayingWithFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tumething",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amazing app"),
      ),
      body: const TaskList(),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListItem(label: 'Go to school'),
        ListItem(label: 'Go to bazar'),
        ListItem(label: 'Read books'),
        ListItem(label: 'Pray, zikr, tilavat'),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String label;

  const ListItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: null),
        Text(
          label,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
