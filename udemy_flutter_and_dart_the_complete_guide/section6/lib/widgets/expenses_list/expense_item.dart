import 'package:flutter/material.dart';
import 'package:section6/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  String capitalizeFirstLetter(String text) {
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.deepPurple),),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('₹${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    // Text('Category: ${capitalizeFirstLetter(expense.category.name)}'),
                    Text('${expense.formatedDate}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
