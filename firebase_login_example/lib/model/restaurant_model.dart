class RestaurantModel {
  final int? id;
  final String? name;
  final String? address;
  final String? image;
  final String? distance;
  final double? rating;

  RestaurantModel({
    this.id,
    this.name,
    this.address,
    this.image,
    this.distance,
    this.rating,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      image: json['image'],
      distance: json['distance'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
