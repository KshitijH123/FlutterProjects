class StoreModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Ratingmodel? rating;

  StoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      title: json['title'],
      price: (json['price']as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Ratingmodel.fromJson(json['rating']),
    );
  }
}

class Ratingmodel {
  final double? rate;
  final int? count;

  Ratingmodel({required this.rate, required this.count});

  factory Ratingmodel.fromJson(Map<String, dynamic> json) {
    return Ratingmodel(
      rate: (json['rate']as num).toDouble(), 
      count: json['count']
    );
  }
}
