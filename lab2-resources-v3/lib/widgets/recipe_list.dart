import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';


class RecipeList extends StatelessWidget {
    const RecipeList({super.key});

    @override
    Widget build(BuildContext context) {
        var uiController = Provider.of<UIController>(context, listen: false);
        var recipeHandler = context.watch<RecipeHandler>();
        var recipes = recipeHandler.bestMatches;
        return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
                var recipe = recipes[index];
                return ListTile(
                    leading: Image.asset(
                    'assets/recipes/${recipe.imagePath}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    ),
                    title: Text(recipe.name),
                    //subtitle: Text(recipe.description),
                    onTap: () {uiController.selectRecipe(recipe);},
                );
            },
        );
    }
}