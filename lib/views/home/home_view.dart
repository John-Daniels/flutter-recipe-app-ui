import 'package:flutter/material.dart';
import 'package:food_recipe_app/views/home/widgets/recipe_card.dart';

import '../../models/recipe.api.dart';
import '../../models/recipe.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Top Recipes',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _recipes.length,
                        itemBuilder: (_, index) {
                          Recipe recipe = _recipes[index];

                          return RecipeCard(
                            title: recipe.name,
                            cookTime: recipe.totalTime,
                            rating: recipe.rating.toString(),
                            thumbnailUrl: recipe.images,
                            onPressed: () {
                              //do something
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         RecipeView(recipe: recipe),
                              //   ),
                              // );
                            },
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
