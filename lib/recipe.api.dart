import 'dart:convert';

import 'package:food_reciepe_app/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd41975f6c6msh3c99be1b8be9376p1df04djsn5e4bb57bd2bc',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
      // "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
