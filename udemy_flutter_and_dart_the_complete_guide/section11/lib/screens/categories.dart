import 'package:flutter/material.dart';
import 'package:section11/data/dummy_data.dart';
import 'package:section11/models/category.dart';
import 'package:section11/models/meal.dart';
import 'package:section11/screens/meals.dart';
import 'package:section11/screens/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {required this.availableMeals,
      // required this.onToggleFavorite,
      super.key});

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// class _CategoriesScreenState extends State<CategoriesScreen> with TickerProviderStateMixin {
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    /*final  List<Meal> mealsWithCategory = List.of(DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }));*/

    /*final  List<Meal> mealsWithCategory = DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }).toList();*/

    final List<Meal> mealsWithCategory = widget.availableMeals
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
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        ),
        builder: (context, child) {
          // return Padding(padding: EdgeInsets.only(top: 100 - _animationController.value * 100), child: child,);

          /*return SlideTransition(
            position: _animationController.drive(
              Tween(
                begin: Offset(0.05, 0.6),
                end: Offset(0, 0),
              ),
            ),
            child: child,
          );*/

          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.6),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.bounceInOut)),
            child: child,
          );
        });

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
