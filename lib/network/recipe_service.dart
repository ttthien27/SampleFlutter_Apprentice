import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
import 'service_interface.dart';

part 'recipe_service.chopper.dart';

const String apiKey = '28daaa403507dda60b2f64233cf62e9a';
const String apiId = 'b730b1ea';
const String apiUrl = 'https://api.edamam.com';

// 1
@ChopperApi()
// 2
abstract class RecipeService extends ChopperService
    implements ServiceInterface {
  // 3
  @override
  @Get(path: 'search')
  // 4
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      // 5
      @Query('q') String query, @Query('from') int from,
      @Query('to') int to);
  static RecipeService create() {
    // 1
    final client = ChopperClient(
      // 2
      baseUrl: apiUrl,
      // 3
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      // 4
      converter: ModelConverter(),
      // 5
      errorConverter: const JsonConverter(),
      // 6
      services: [
        _$RecipeService(),
      ],
    );
    // 7
    return _$RecipeService(client);
  }
}
Request _addQuery(Request req) {
  // 1
  final params = Map<String, dynamic>.from(req.parameters);
  // 2
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  // 3
  return req.copyWith(parameters: params);
}

/*class RecipeService {
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
}*/