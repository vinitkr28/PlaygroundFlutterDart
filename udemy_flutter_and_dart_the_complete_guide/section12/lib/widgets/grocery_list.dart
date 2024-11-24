import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:section12/data/categories.dart';
import 'package:section12/models/category.dart';

import 'package:section12/models/grocery_item.dart';
import 'package:section12/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  // final List<GroceryItem> _groceryItems = [...groceryItems];
  final List<GroceryItem> _groceryItems = [];


  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _groceryItems.clear();
    _loadItems();
  }

  void _printResponse(http.Response response) {
    print("Firebase response:statusCode: ${response.statusCode}");
    print("Firebase response:reasonPhrase: ${response.reasonPhrase}");
    print("Firebase response:contentLength: ${response.contentLength}");
    print("Firebase response:headers: ${response.headers.toString()}");
    print("Firebase response:isRedirect: ${response.isRedirect}");
    print("Firebase response:persistentConnection: ${response.persistentConnection}");
    print("Firebase response:request: ${response.request.toString()}");
    print("Firebase response:body: ${response.body}");
    print("Firebase response: ${response.toString()}");
  }

  void _loadItems() async {
    final url = Uri.https(
        'udemyfluttercompleteguide-default-rtdb.firebaseio.com',
        'shopping-list.json');

    try{
      final response = await http.get(url);


      // throw Exception('An error occured!');


      if(response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });

        return;
      }

      if(response.body.toLowerCase() == 'null'){
        print('Empty Firebase');
        setState(() {
          _isLoading = false;
        });
        return;
      }


      print('Firebase GET response: ${response.body}');

      var parsed = json.decode(response.body);

      if(parsed is! Map<String, dynamic>) {
        setState(() {
          _isLoading = false;
          return;
        });
      };

      // final Map<String, Map<String, dynamic>> listData = parsed;
      final Map<String, dynamic> listData = parsed;

      final List<GroceryItem> _loadedItems = [];
      for (final item in listData.entries) {
        final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category']);
        _loadedItems.add(
          GroceryItem(
              id: item.key,
              name: item.value['name'],
              quantity: item.value['quantity'],
              category: category.value),
        );
      }

      print('loadedItems: $_loadedItems');
      setState(() {
        _groceryItems.addAll(_loadedItems);
        _isLoading = false;
      });
    } catch(error){
      setState(() {
        _error = 'Something went wrong.';
      });
    }




  }

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) {
      return const NewItem();
    }));

    /*if (newItem == null) {
      return;
    }*/

    _loadItems();

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

    if(response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
        _error = 'Failed to delete data. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No items added yet.'),
    );

    if(_isLoading){
      content = const Center(child: CircularProgressIndicator(color: Colors.red,),);
    }

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
          onDismissed: (direction) {
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

    if(_error != null) {
      content = Center(child: Text(_error.toString()),);
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
