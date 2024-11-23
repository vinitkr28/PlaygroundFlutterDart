import 'package:riverpod/riverpod.dart';
import 'package:section9/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    /*if(mealIsFavorite){
      state = state.where((m) => m.mealId != meal.mealId).toList();
    } else {
      state = [...state, meal];
    }*/


    if(mealIsFavorite){
      state = state.where((m) => m.mealId != meal.mealId).toList();
      return false;
    }
      state = [...state, meal];
    return true;

  }


}

final favouriteMealProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});