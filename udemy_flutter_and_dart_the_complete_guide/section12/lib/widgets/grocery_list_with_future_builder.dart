import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:section12/data/categories.dart';
import 'package:section12/models/category.dart';

import 'package:section12/models/grocery_item.dart';
import 'package:section12/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryListWithFutureBuilder extends StatefulWidget {
  const GroceryListWithFutureBuilder({super.key});

  @override
  State<GroceryListWithFutureBuilder> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryListWithFutureBuilder> {
  // final List<GroceryItem> _groceryItems = [...groceryItems];
  final List<GroceryItem> _groceryItems = [];

  String? _error;
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _groceryItems.clear();
    // _loadItems();
    _loadedItems = _loadItemsReturnList();
  }

  void _printResponse(http.Response response) {
    print("Firebase response:statusCode: ${response.statusCode}");
    print("Firebase response:reasonPhrase: ${response.reasonPhrase}");
    print("Firebase response:contentLength: ${response.contentLength}");
    print("Firebase response:headers: ${response.headers.toString()}");
    print("Firebase response:isRedirect: ${response.isRedirect}");
    print(
        "Firebase response:persistentConnection: ${response.persistentConnection}");
    print("Firebase response:request: ${response.request.toString()}");
    print("Firebase response:body: ${response.body}");
    print("Firebase response: ${response.toString()}");
  }

  // Future<List<GroceryItem>?> _loadItemsReturnList() async {
  Future<List<GroceryItem>> _loadItemsReturnList() async {
    final url = Uri.https(
        'udemyfluttercompleteguide-default-rtdb.firebaseio.com',
        'shopping-list.json');

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch.');

      return [];
    }

    if (response.body.toLowerCase() == 'null') {
      print('Empty Firebase');
      // setState(() {
      //   _isLoading = false;
      // });
      return [];
    }

    print('Firebase GET response: ${response.body}');

    var parsed = json.decode(response.body);

    // final Map<String, Map<String, dynamic>> listData = parsed;
    final Map<String, dynamic> listData = parsed;

    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries.firstWhere(
          (catItem) => catItem.value.title == item.value['category']);
      _loadedItems.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category.value),
      );
    }

    print('loadedItems: $_loadedItems');

    return _loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return const NewItem();
    }));

    /*if (newItem == null) {
      return;
    }*/

    _loadItemsReturnList();

    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);

    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        'udemyfluttercompleteguide-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    _printResponse(response);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
        _error = 'Failed to delete data. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      // body: FutureBuilder(future: _loadItemsReturnList(), builder: (context, snapshot){//will load _loadItemsReturnList function every time when build function load.
      body: FutureBuilder(
          future: _loadedItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.data!.isEmpty) {
              return Text('No items added yet.');
            }

            var data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, index) => Dismissible(
                background: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
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
                        decoration: const BoxDecoration(color: Colors.green),
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
                key: ValueKey(data[index].id),
                // onDismissed: (direction) {
                //   setState(() {
                //     data.removeAt(index);
                //   });
                // },
                onDismissed: (direction) {
                  _removeItem(data[index]);
                },
                child: ListTile(
                  title: Text(data[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: data[index].category.color,
                  ),
                  trailing: Text(
                    data[index].quantity.toString(),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
