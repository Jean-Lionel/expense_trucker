import 'package:flutter/material.dart';

class NewExpensive extends StatefulWidget {
  const NewExpensive({super.key});

  @override
  State<NewExpensive> createState() => _NewExpensiveState();
}

class _NewExpensiveState extends State<NewExpensive> {
  final _titleController = new TextEditingController();
  final _amountController = new TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Amount"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expensive'),
              )
            ],
          )
        ],
      ),
    );
  }
}
