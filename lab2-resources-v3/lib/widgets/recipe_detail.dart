import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe.dart';




class RecipeDetail extends StatelessWidget {
    const RecipeDetail(this.recipe, {super.key});
    final Recipe recipe;
    @override
    Widget build(BuildContext context) {
        var uiController = Provider.of<UIController>(context, listen: false);

        return Stack(
            children: [
                Row(
                    children: [
                        const SizedBox(width: 32),
                        Image.asset(
                            'assets/recipes/${recipe.imagePath}',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 32),
                        Text(
                            recipe.name,
                                style: const TextStyle(
                                    fontSize: 24,
                                ),
                            ),
                        const SizedBox(width: 32),
                        IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                            uiController.deselectRecipe();
                            },
                        ),
                    ],
                ),
            ],
        );
    }
}

