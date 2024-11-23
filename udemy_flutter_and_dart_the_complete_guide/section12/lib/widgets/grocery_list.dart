import 'package:flutter/material.dart';
import 'package:section12/models/grocery_item.dart';
import 'package:section12/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [...groceryItems];

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return const NewItem();
    }));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No items added yet.'),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
// margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
// margin: Theme.of(context).cardTheme.margin,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
          key: ValueKey(_groceryItems[index].id),
          // onDismissed: (direction) {
          //   setState(() {
          //     _groceryItems.removeAt(index);
          //   });
          // },
          onDismissed: (direction){
            _removeItem(_groceryItems[index]);
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
