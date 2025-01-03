import 'package:flutter/material.dart';

import '../model/Place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}

// var d = Center(
// child: Text(
// place.title,
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge!
//     .copyWith(color: Theme.of(context).colorScheme.onBackground),
// ),
// );
