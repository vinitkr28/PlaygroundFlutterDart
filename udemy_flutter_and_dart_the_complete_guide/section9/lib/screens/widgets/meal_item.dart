import 'package:flutter/material.dart';
import 'package:section9/models/meal.dart';
import 'package:section9/screens/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, required this.onSelectMeal, super.key});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    if (meal.complexity.name.length > 1) {
      return meal.complexity.name[0].toUpperCase() +
          meal.complexity.name.substring(1);
    } else if (meal.complexity.name.isNotEmpty) {
      return meal.complexity.name[0].toUpperCase();
    } else {
      return "";
    }
  }

  String get affordabilityText {
    if (meal.affordability.name.length > 1) {
      return meal.affordability.name[0].toUpperCase() +
          meal.affordability.name.substring(1);
    } else if (meal.affordability.name.isNotEmpty) {
      return meal.affordability.name[0].toUpperCase();
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          /*Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return MealDetails(meal);
          }));*/

          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              // top: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
