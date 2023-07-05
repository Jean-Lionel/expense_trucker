import 'package:flutter/material.dart';

class NewExpensive extends StatefulWidget {
  const NewExpensive({super.key});

  @override
  State<NewExpensive> createState() => _NewExpensiveState();
}

class _NewExpensiveState extends State<NewExpensive> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
        ],
      ),
    );
  }
}
