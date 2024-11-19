import 'package:flutter/material.dart';
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
            background: Container(
              // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              // margin: Theme.of(context).cardTheme.margin,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              // color: Colors.red,
              color: Theme.of(context).colorScheme.error.withOpacity(.75),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expanses[index]);
            },
            child: ExpenseItem(expanses[index]),
          );
        });
  }
}
