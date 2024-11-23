import 'package:flutter/material.dart';
import 'package:section10/data/dummy_data.dart';
import 'package:section10/models/category.dart';
import 'package:section10/models/meal.dart';
import 'package:section10/screens/meals.dart';
import 'package:section10/screens/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {
        required this.availableMeals,
      // required this.onToggleFavorite,
      super.key});

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    /*final  List<Meal> mealsWithCategory = List.of(DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }));*/

    /*final  List<Meal> mealsWithCategory = DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }).toList();*/

    final List<Meal> mealsWithCategory = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    print('Meals: $mealsWithCategory');

    // Navigator.of(context).push(route)
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meals: mealsWithCategory,
        // onToggleFavorite: onToggleFavorite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );

    /*return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for(final category in  availableCategories)
            CategoryGridItem(category: category, onSelectCategory: (){
              _selectCategory(context, category);
            },)
        ],
      ),
    );*/
  }
}
