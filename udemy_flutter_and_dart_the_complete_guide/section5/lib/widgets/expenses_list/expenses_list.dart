import 'package:flutter/cupertino.dart';
import 'package:section5/models/expense.dart';
import 'package:section5/widgets/expenses_list/expense_item.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
    required this.expanses,
    required this.onRemoveExpense,
    super.key,
  });

  final List<Expense> expanses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(expanses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expanses[index]);
            },
            child: ExpenseItem(expanses[index]),
          );
        });
  }
}
