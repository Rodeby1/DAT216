import 'package:flutter/material.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';


class DifficulyControl extends StatefulWidget {
   const DifficulyControl({super.key});

   @override
   State<DifficulyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficulyControl> {
    String _difficulty = Difficulty.labels[0];

    @override
    Widget build(BuildContext context) {
        var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

        return Column(
            children: [
                for (int i = 0; i < Difficulty.labels.length; i++)
                RadioListTile<String>(
                    dense: true,
                    title: i == 0
                        ? Text(Difficulty.labels[i]) // First row without an icon
                        : Row(
                            children: [
                            Difficulty.icons[i]!, // Add the icon
                            SizedBox(width: 8), // Add spacing between icon and text
                            Text(Difficulty.labels[i]), // Add the label
                            ],
                        ),
                    value: Difficulty.labels[i],
                    groupValue: _difficulty,
                    onChanged: (value) {
                    setState(() {
                        _difficulty = value!;
                    });
                    recipeHandler.setDifficulty(value!);
                    },
                ),
            ],
        );
    }
}