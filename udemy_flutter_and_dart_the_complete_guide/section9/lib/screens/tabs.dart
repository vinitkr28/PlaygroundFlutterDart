
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

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // final List<Meal> _favoriteMeals = [];

  // Map<Filter, bool> _selectedFilter = kInitialFilter;

  /*void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // duration: Duration(seconds: 3),
      ),
    );
  }*/

  /*void _toggleMEalFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    setState(() {
      if (isExisting) {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favorite');
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage('Marked as a favorite');
      }
    });
  }*/

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  /*void _setScreen(String identifier) async {
    //meals, filters
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {return FiltersScreen();}));

      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        // return FiltersScreen2(currentFilter: _selectedFilter,);
        return const FiltersScreen();
      }));

      print('result: $result');

      // setState(() {
      //   _selectedFilter = result ?? kInitialFilter;
      // });
    } else {
      // setState(() {
      // Navigator.of(context).pop();
      // });
    }
  }*/


  void _setScreen(String identifier) async {
    //meals, filters
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {return FiltersScreen();}));

      await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        // return FiltersScreen(currentFilter: _selectedFilter,);
        return const FiltersScreen2();
      }));

      // print('result: $result');

      // setState(() {
      //   _selectedFilter = result ?? kInitialFilter;
      // });
    } else {
      // setState(() {
      // Navigator.of(context).pop();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    /*final availableMeals = meals.where((meal){
      if(_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if(_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if(_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if(_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();*/


    final activeFilter = ref.watch(filtersProvider);
    final availableMeals = meals.where((meal){
      if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if(activeFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      // onToggleFavorite: _toggleMEalFavoriteStatus,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {

      final favoriteMeals = ref.watch(favouriteMealProvider);

      activePageTitle = 'Your Favorities';
      // activePage = MealsScreen(title: null, meals: _favoriteMeals, onToggleFavorite: _toggleMEalFavoriteStatus,);
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
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorities'),
        ],
      ),
    );
  }
}
