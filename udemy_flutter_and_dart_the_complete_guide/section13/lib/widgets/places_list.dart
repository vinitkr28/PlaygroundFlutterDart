import 'package:flutter/material.dart';
import 'package:section13/model/Place.dart';
import 'package:section13/screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({required this.places, super.key});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => PlaceDetailScreen(place: places[index])));
            },
            title: Text(
              places[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          );
        });
  }
}
