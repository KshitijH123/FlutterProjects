class RecipesModel {
  List<Recipe>? recipes;

  RecipesModel({this.recipes});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipe>[];
      json['recipes'].forEach((e) {
        recipes!.add(Recipe.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (recipes != null) {
      data['recipes'] = recipes!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipe({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ingredients = json['ingredients']?.cast<String>();
    instructions = json['instructions']?.cast<String>();
    prepTimeMinutes = json['prepTimeMinutes'];
    cookTimeMinutes = json['cookTimeMinutes'];
    servings = json['servings'];
    difficulty = json['difficulty'];
    cuisine = json['cuisine'];
    caloriesPerServing = json['caloriesPerServing'];
    tags = json['tags']?.cast<String>();
    userId = json['userId'];
    image = json['image'];
    rating = json['rating']?.toDouble();
    reviewCount = json['reviewCount'];
    mealType = json['mealType']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['id'] = id;
    json['name'] = name;
    json['ingredients'] = ingredients;
    json['instructions'] = instructions;
    json['prepTimeMinutes'] = prepTimeMinutes;
    json['cookTimeMinutes'] = cookTimeMinutes;
    json['servings'] = servings;
    json['difficulty'] = difficulty;
    json['cuisine'] = cuisine;
    json['caloriesPerServing'] = caloriesPerServing;
    json['tags'] = tags;
    json['userId'] = userId;
    json['image'] = image;
    json['rating'] = rating;
    json['reviewCount'] = reviewCount;
    json['mealType'] = mealType;

    return json;
  }
}
