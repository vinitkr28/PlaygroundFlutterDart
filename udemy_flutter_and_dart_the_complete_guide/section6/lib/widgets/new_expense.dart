import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

//final formatter = DateFormat.yMd();//it is already there in expense.dart file

class NewExpense extends StatefulWidget {
  NewExpense(this.addExpanse, {super.key});

  void Function(Expense expense) addExpanse;

  @override
  State<NewExpense> createState() => _NewExpenseState2();
}

class _NewExpenseState2 extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.LEISURE;

  void _presentDatePickerUseOfThen() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      cancelText: 'Close',
      helpText: 'Help Test',
    ).then((value) {});
  }

  void _presentDatePickerUseOfAsync() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });

    //wait for this line
    print('pickedDate: $pickedDate');
  }

  void _submitExpenseData() {
    print('_enteredTitle: ${_titleController.text}, '
        '_amountController:${_amountController.text}');

    final enteredAmount = double.tryParse(_amountController
        .text); //tryParse('Hello') => null, tryParse(21.2) => 21.2

    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty) {
      //show error message for title
      _showErrorDialog('Please make sure a valid title was entered');
      return;
    }

    if (amountIsInvalid) {
      //show error message for amount
      _showErrorDialog('Please make sure a valid amount was entered');
      return;
    }

    if (_selectedDate == null) {
      //show error message for date
      _showErrorDialog('Please make sure a valid date was entered');
      return;
    }

    Navigator.pop(context);

    widget.addExpanse(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Invalid Input"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Close')),
        ],
      ),
    );

    // return;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _saveTitleInput,
            maxLength: 50,
            // keyboardType: TextInputType.text,//default, no need to set this.
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  // onChanged: _saveTitleInput,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '₹', label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const Text('Selected Date'),
                    Text(_selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePickerUseOfAsync,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.yellow),
                child: DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    print('DropdownButton Category Selected: $value');
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              // const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _NewExpenseState1 extends State<NewExpense> {
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            // keyboardType: TextInputType.text,//default, no need to set this.
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print('_enteredTitle: $_enteredTitle');
                },
                child: const Text('Save Expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
