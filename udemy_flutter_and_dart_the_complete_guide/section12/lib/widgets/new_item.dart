import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:section12/data/categories.dart';
import 'package:section12/models/category.dart';
import 'package:section12/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _printResponse(http.Response response) {
    print("Firebase response: ${response.statusCode}");
    print("Firebase response: ${response.reasonPhrase}");
    print("Firebase response: ${response.contentLength}");
    print("Firebase response: ${response.headers.toString()}");
    print("Firebase response: ${response.isRedirect}");
    print("Firebase response: ${response.persistentConnection}");
    print("Firebase response: ${response.request.toString()}");
    print("Firebase response: ${response.toString()}");
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isSending = true;
      });

      final url = Uri.https(
          'udemyfluttercompleteguide-default-rtdb.firebaseio.com',
          'shopping-list.json');

      final jsonData = {
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title
      };

      /*http.post(url, headers: {
        'Content-Type': 'application/json',
      }, body: json.encode(jsonData)).then((response){
        _printResponse(response);
      });*/

      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(jsonData));

      _printResponse(response);


      if(response.statusCode >= 400) {

      }

      print('Name: $_enteredName');
      print('Quantity: $_enteredQuantity');
      print('Category: ${_selectedCategory.title}');

      final Map<String, dynamic> resDate = json.decode(response.body);

      if (!context.mounted) {
        print('context not mounted.');
        return;
      }

      Navigator.of(context).pop(
        GroceryItem(
            id: response.body,
            // id: resDate['name'],
            name: _enteredName,
            quantity: _enteredQuantity,
            category: _selectedCategory),
      );

      /*Navigator.of(context).pop(
        GroceryItem(
            id: DateTime.now().toString(),
            name: _enteredName,
            quantity: _enteredQuantity,
            category: _selectedCategory),
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 & 50 characters';
                  }

                  return null;
                },
                onSaved: (value) {
                  // if(value == null) {
                  //   return;
                  // }
                  _enteredName = value!;
                },
              ), //instead of TextField()
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid, positive number';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      // onSaved: (value) {},//not required
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title)
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset')),
                  ElevatedButton(
                      onPressed: _isSending ? null : _saveItem,
                      child: _isSending
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            )
                          : const Text('Add Item')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
