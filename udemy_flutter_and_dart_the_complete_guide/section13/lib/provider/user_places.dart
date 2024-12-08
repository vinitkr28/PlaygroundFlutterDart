import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/model/Place.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
    },
    version: 1,
  );

  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void loadPlaces() async {
    final db = await _getDatabase();
    
    db.query('user_places')
  }

  void addPlace(String title, File image) async {
    final newPlace = Place(title: title, image: image);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': uuid.v4(),
      'title': 'title_${DateTime.now()}',
      'image': 'image_${DateTime.now()}',
      'lat': 'lat_${DateTime.now()}',
      'lng': 'lng_${DateTime.now()}',
      'address': 'address_${DateTime.now()}',
    });

    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
