import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart'; 
import 'package:lab2/util/main_ingredient.dart';




class RecipeDetail extends StatelessWidget {
    const RecipeDetail(this.recipe, {super.key});
    final Recipe recipe;
    @override
    Widget build(BuildContext context) {
        var uiController = Provider.of<UIController>(context, listen: false);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.all(AppTheme.paddingSmall),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: AppTheme.paddingHuge),
                    _image(recipe),
                    const SizedBox(height: 16), 
                    Text(
                    'Ingredienser',
                    style: AppTheme.smallHeading, 
                    ),
                    const SizedBox(height: 8), 
                    Text(
                    '${recipe.servings} Portioner', 
                    style: AppTheme.smallText.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...recipe.ingredients.map((ingredient) => Text(
                        '\t\t $ingredient',
                        style: AppTheme.smallText,
                        )),
                    ],
                ),
                SizedBox(width: AppTheme.paddingSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: AppTheme.paddingHuge),
                      Text(
                        recipe.name,
                        style: AppTheme.largeHeading,
                      ),
                      Row(
                        children: [
                          MainIngredient.icon(recipe.mainIngredient, width: 14)!,
                          const SizedBox(width: 8),
                          Difficulty.icon(recipe.difficulty, width: 42)!,
                          const SizedBox(width: 8),
                          Text('${recipe.time} minuter', style: AppTheme.smallText),
                          const SizedBox(width: 8),
                          Text('${recipe.price}kr', style: AppTheme.smallText),
                        ],
                      ),
                      SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: AppTheme.paddingMedium),
                      Text('Tillagning:',
                        style: AppTheme.smallText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        recipe.instruction,
                        style: AppTheme.smallText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8, // Position the IconButton at the top
            right: 8, // Align the IconButton to the right
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                uiController.deselectRecipe();
              },
            ),
          ),
        ],
      ),
    );
  }
    Widget _image(recipe) {
        var square = ClipRect(
            child: Container(
                width: 240,
                height: 240, 
                child: FittedBox(fit: BoxFit.cover, child: recipe.image),
            ),
        );

        var flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);

        return Stack(
        children: [
            square,
            if (flagImage != null)
            Positioned(
                bottom: 16,
                right: 16,
                child: flagImage,
            ),
        ],
        );
    }
}

