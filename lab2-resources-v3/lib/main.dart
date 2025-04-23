import 'package:flutter/material.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_area.dart';

void main() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RecipeHandler()),
          ChangeNotifierProvider(create: (context) => UIController()),
        ],
        child: const MyApp(),
      ),
    ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(children: [_controlPanel(context), RecipeArea()]),
      ),
    );
  }
   Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: const [
          Text(
            'Receptsök',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Hitta ett recept som passar genom att ändra inställningarna nedanför',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Row(
            children: const [
              Text(
                'Ingrediens:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 10), // Mellanrum mellan text och kontroll
              IngredientControl(),
            ],
          ),
          Row(
            children: const [
              Text(
                'Kök:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 10), // Mellanrum mellan text och kontroll
              KitchenControl(),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Svårighetsgrad:',
            style: TextStyle(fontSize: 16),
          ),
          DifficulyControl(),
          SizedBox(height: 32),
          Text(
            'Maxpris:',
            style: TextStyle(fontSize: 16),
          ),
          PriceControl(),
          SizedBox(height: 32),
          Text(
            'Maxtid:',
            style: TextStyle(fontSize: 16),
          ),
          TimeControl(),
        ],
      ),
    );
    RecipeArea();
  }
}
