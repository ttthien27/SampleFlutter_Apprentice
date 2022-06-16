import 'models/models.dart';

abstract class Repository {

  // 1
  Stream<List<Recipe>> watchAllRecipes();
// 2
  Stream<List<Ingredient>> watchAllIngredients();

  Future<List<Recipe>> findAllRecipes();
  Future<Recipe> findRecipeById(int id);
  Future<List<Ingredient>> findAllIngredients();
  Future<List<Ingredient>> findRecipeIngredients(int recipeId);
  Future<int> insertRecipe(Recipe recipe);
  Future<List<int>> insertIngredients(List<Ingredient>
  ingredients);
  Future<void> deleteRecipe(Recipe recipe);
  Future<void> deleteIngredient(Ingredient ingredient);
  Future<void> deleteIngredients(List<Ingredient> ingredients);
  Future<void> deleteRecipeIngredients(int recipeId);
  Future init();
  void close();
}
