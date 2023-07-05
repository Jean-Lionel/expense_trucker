import 'package:expense_trucker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpensive extends StatefulWidget {
  const NewExpensive(this.addExpense, {super.key});

  final void Function(Expense expense) addExpense;
  @override
  State<NewExpensive> createState() => _NewExpensiveState();
}

class _NewExpensiveState extends State<NewExpensive> {
  final _titleController = new TextEditingController();
  final _amountController = new TextEditingController();

  DateTime? _selectDate;
  Category? _selectedCategorie = Category.leisure;

  void _saveDataOfExpensive() {
    final amount = double.tryParse(_amountController.text);

    bool isInValidAmount = amount == null || amount < 0;

    if (_titleController.text.trim().isEmpty ||
        isInValidAmount ||
        _selectDate == null) {
      showDialog(
          context: context,
          builder: (ctxt) => AlertDialog(
                title: const Text("Error "),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctxt);
                    },
                    child: const Text("Okey"),
                  ),
                ],
              ));
      return;
    }
    Expense e = Expense(
      title: _titleController.text,
      amount: amount,
      date: _selectDate!,
      category: _selectedCategorie!,
    );
    widget.addExpense(e);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _selectedDate() async {
    final now = DateTime.now();
    final initialDate = DateTime(now.year - 1, now.month, now.day);

    final selectDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: initialDate,
        lastDate: now);

    setState(() {
      _selectDate = selectDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectDate == null
                        ? 'no Date Selected'
                        : format.format(_selectDate!)),
                    IconButton(
                        onPressed: _selectedDate,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategorie,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _selectedCategorie = v;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _saveDataOfExpensive,
                child: const Text('Save Expensive'),
              )
            ],
          )
        ],
      ),
    );
  }
}
