import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_recipe_app/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {"limit": "18", "start": "0", "tag": "list.recipe.popular"},
    );

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key':
          'ab01c239f4msh68c4f22a63d8962p11f0c1jsn2a74aa59265d', // PLS USE UR OWN API KEY
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': "true",
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var feed in data['feed']) {
      temp.add(feed['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
