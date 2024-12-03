import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/model/Place.dart';



class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier():super(const []);


  void addPlace(String title, File image) {
    final newPlace = Place(title: title, image: image);

    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) => UserPlacesNotifier());
