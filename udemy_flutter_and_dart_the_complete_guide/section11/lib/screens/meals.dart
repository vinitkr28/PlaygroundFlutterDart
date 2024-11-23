import 'package:flutter/material.dart';
import 'package:section11/screens/widgets/meal_item.dart';

import '../models/meal.dart';
import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {this.title,
      required this.meals,
      // required this.onToggleFavorite,
      super.key});

  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavorite;

  void _onSelectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetails(
        meal,
        // onToggleFavorite: onToggleFavorite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // meals.clear();

    // List<Meal> emptyMeal = List.of(meals);
    // emptyMeal.clear();

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        // return Text(meals[index].title, style: Theme.of(ctx).textTheme.titleLarge!.copyWith(color: Colors.white));
        return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              _onSelectMeal(meal, ctx);
            });
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  // .copyWith(color: Theme.of(context).colorScheme.background),
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}

/*
Column(
mainAxisAlignment: MainAxisAlignment.start,
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
for (final meal in meals)
Text(
meal.title,
style: Theme.of(context)
    .textTheme
    .titleLarge!
    .copyWith(color: Colors.white),
)
],
)*/
