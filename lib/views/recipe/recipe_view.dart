import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  const RecipeView({super.key, required this.recipe});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    var recipe = widget.recipe;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Hero(
              tag: 'recipe-${recipe.name}',
              child: Image.network(
                recipe.images,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            recipe.name,
          )
        ],
      ),
    );
  }
}
