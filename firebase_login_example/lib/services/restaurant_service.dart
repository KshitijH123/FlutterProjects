import 'dart:convert';

import 'package:firebase_login_example/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

final restaurant =
    '[{"id":1,"name":"Spice Garden Bistro","address":"MG Road, Bengaluru","image":"https://mysoreaduge.com/wp-content/uploads/2025/06/happy-waiter-serving-food-group-cheerful-friends-pub-1410x830.jpg","distance":"1.2 km","rating":4.5},{"id":2,"name":"Urban Tadka Cafe","address":"Koregaon Park, Pune","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7D8GtVhLSqmAT-H30MAOZsataFTlGF0jAcA&s","distance":"2.8 km","rating":4.1},{"id":3,"name":"Royal Biryani Hub","address":"Charminar, Hyderabad","image":"https://content.jdmagicbox.com/v2/comp/hyderabad/u1/040pxx40.xx40.220319152238.e7u1/catalogue/pnr-food-plaza-and-restaurant-hyderabad-restaurants-m6h57h0sej.jpg","distance":"0.9 km","rating":4.7},{"id":4,"name":"Coastal Curry House","address":"Fort Kochi, Kochi","image":"https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2025-08/Tubata%20by%20Neeraj%20Aggarwal%20Brings%20Nature-Inspired%20Dining%20to%20Delhi.jpg","distance":"3.4 km","rating":4.3},{"id":5,"name":"Punjabi Zaika Dhaba","address":"Sector 17, Chandigarh","image":"https://resizer.otstatic.com/v3/photos/71719678-3?width=1280&height=720&webp=true","distance":"1.6 km","rating":4},{"id":6,"name":"The Veg Delight","address":"Anna Nagar, Chennai","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIM6N32oYzQFW3AVDQq0Vb-TjZ5VpL3Qb3w&s","distance":"2.3 km","rating":4.2},{"id":7,"name":"Bombay Street Eats","address":"Juhu, Mumbai","image":"https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2025-08/Tubata%20by%20Neeraj%20Aggarwal%20Brings%20Nature-Inspired%20Dining%20to%20Delhi.jpg","distance":"0.7 km","rating":4.6},{"id":8,"name":"Masala Avenue","address":"Civil Lines, Delhi","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIM6N32oYzQFW3AVDQq0Vb-TjZ5VpL3Qb3w&s","distance":"4.1 km","rating":3.9},{"id":9,"name":"Tandoor Flame Grill","address":"Hinjewadi, Pune","image":"https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2025-08/Tubata%20by%20Neeraj%20Aggarwal%20Brings%20Nature-Inspired%20Dining%20to%20Delhi.jpg","distance":"2.0 km","rating":4.4},{"id":10,"name":"Saffron Aroma Kitchen","address":"Indiranagar, Bengaluru","image":"https://resizer.otstatic.com/v3/photos/71719678-3?width=1280&height=720&webp=true","distance":"3.9 km","rating":4.1}]';

class RestaurantService {
  RestaurantService._();

  static final RestaurantService instance = RestaurantService._();

  Future<List<RestaurantModel>> fetchRestaurant() async {
    final response = http.Response(restaurant, 200);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => RestaurantModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
