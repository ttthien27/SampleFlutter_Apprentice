import 'models/models.dart';

abstract class Repository {
  // 1
  List<Recipe> findAllRecipes();

// 2
  Recipe findRecipeById(int id);

// 3
  List<Ingredient> findAllIngredients();

// 4
  List<Ingredient> findRecipeIngredients(int recipeId);

  // 5
  int insertRecipe(Recipe recipe);

  // 6
  List<int> insertIngredients(List<Ingredient> ingredients);

  // 7
  void deleteRecipe(Recipe recipe);

  // 8
  void deleteIngredient(Ingredient ingredient);

  // 9
  void deleteIngredients(List<Ingredient> ingredients);

  // 10
  void deleteRecipeIngredients(int recipeId);

  // 11
  Future init();
  // 12
  void close();
}
