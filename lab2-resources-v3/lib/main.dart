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
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/app_theme.dart';



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
      theme: ThemeData(
        colorScheme: AppTheme.colorScheme,
        textTheme: AppTheme.textTheme,
      ),
      home: Scaffold(
        body: Row(children: 
        [const SizedBox(width: AppTheme.paddingMedium),
          _controlPanel(context), 
        const SizedBox(width: AppTheme.paddingLarge),
        RecipeArea(),
        const SizedBox(width: AppTheme.paddingMedium),]),
      ),
    );
  }
   Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      child: Column(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the Logo horizontally
            children: [
              Logo(),
            ],
          ),
          Center(
            child: Text(
            'Hitta ett recept som passar genom att ändra inställningarna nedanför',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          ),
          
          AppTheme.pad,
          IngredientControl(),
          AppTheme.pad,
          KitchenControl(),
          AppTheme.pad,
          Text(
            'Svårighetsgrad:',
            style: TextStyle(fontSize: 16),
          ),
          DifficulyControl(),
          AppTheme.padBig,
          Text(
            'Maxpris:',
            style: TextStyle(fontSize: 16),
          ),
          PriceControl(),
          AppTheme.padBig,
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
