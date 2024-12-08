import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/provider/user_places.dart';
import 'package:section13/widgets/image_input.dart';
import 'package:section13/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  File? _selectedImage;


  void _savePlaces(){
    final enteredText = _titleController.text;

    if(enteredText.isEmpty) {
      showDialog(context: context, builder: (ctx) => AlertDialog(icon: Icon(Icons.ac_unit), title: Text('Mandatory'),actions: [
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: const Text('Close'))
      ] ,));
      return;
    }

    if(_selectedImage == null) {
      return;
    }

    ref.read(userPlaceProvider.notifier).addPlace(enteredText, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ss = ref.watch(placeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new Place'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              const SizedBox(height: 10),
              ImageInput(onPickImage: (image){
                _selectedImage = image;
              },),
              const SizedBox(height: 10),
              LocationInput(),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _savePlaces();
                  // Navigator.of(context).pop();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              )
            ],
          ),
        ));
  }
}

var d = Column(
  children: [
    TextField(
      // controller: _textEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: 'Title',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    ),
    SizedBox(height: 16),
    ElevatedButton.icon(
      onPressed: () {
        // ss.add(_textEditingController.text);
        // Navigator.of(context).pop();
      },
      label: Text('Add Place'),
      icon: Icon(Icons.add),
    )
  ],
);
