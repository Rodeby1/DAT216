import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeListItem extends StatelessWidget {
    const RecipeListItem(this.recipe, {required this.onTap, super.key});

    final Recipe recipe;
    final void Function() onTap;

    @override
    Widget build(BuildContext context) {
        var uiController = Provider.of<UIController>(context, listen: false);
        return ListTile(
            leading: recipe.image,
            title: Text(recipe.name),
            onTap: () {
                uiController.selectRecipe(recipe);
            },
            shape: Border.all(),
        );
    }
}