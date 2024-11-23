import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section9/provider/favorites_provider.dart';
import 'package:section9/provider/meals_provider.dart';
import 'package:section9/screens/widgets/main_drawer.dart';

import '../models/meal.dart';
import '../provider/filters_provider.dart';
import 'categories.dart';
import 'filters.dart';
import 'filters2.dart';
import 'meals.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen2 extends ConsumerStatefulWidget {
  const TabsScreen2({super.key});

  @override
  ConsumerState<TabsScreen2> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen2> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        return const FiltersScreen2();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filterMealProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favouriteMealProvider);

      activePageTitle = 'Your Favorites';
      activePage = MealsScreen(meals: favoriteMeals);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
