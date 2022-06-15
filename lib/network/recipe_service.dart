import 'package:http/http.dart';
import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';

const String apiKey = '28daaa403507dda60b2f64233cf62e9a';
const String apiId = 'b730b1ea';
const String apiUrl = 'https://api.edamam.com/search';


class RecipeService {
  // 1
  Future getData(String url) async {
    // 2
    print('Calling url: $url');
    // 3
    final response = await get(Uri.parse(url));
    // 4
    if (response.statusCode == 200) {
      // 5
      return response.body;
    } else {
      // 6
      print(response.statusCode);
    }
  }
// 1
  Future<dynamic> getRecipes(String query, int from, int to) async
  {
    // 2
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
        // 3
        return recipeData;
    }
}