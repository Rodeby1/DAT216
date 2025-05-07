import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart'; 
import 'package:lab2/util/main_ingredient.dart';


class RecipeListItem extends StatelessWidget {
    const RecipeListItem(this.recipe, {required this.onTap, super.key});

    final Recipe recipe;
    final void Function() onTap;  

    @override
    Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
        child: InkWell( // Nytt
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
            height: 128,
            child: Row(
            children: [
                SizedBox(width: AppTheme.paddingSmall), 
                _image(recipe),
                SizedBox(width: AppTheme.paddingSmall),
                Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start, 
                    children: [
                    Text(
                        recipe.name,
                        style: AppTheme.mediumHeading, 
                    ),
                    Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                    ],
                ),
                ), 
            ],
            ),
      ),
        )
    );
  }
    Widget _image(recipe) {
        var square = ClipRect(
            child: Container(
                width: 104,
                height: 104, 
                child: FittedBox(fit: BoxFit.cover, child: recipe.image),
            ),
        );

        var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

        return Stack(
        children: [
            square,
            if (flagImage != null)
            Positioned(
                bottom: 8,
                right: 8,
                child: flagImage,
            ),
        ],
        );
    }
}