import 'package:api_demo_restaurant/model/restaurant_model.dart';
import 'package:api_demo_restaurant/search_screen.dart';
import 'package:api_demo_restaurant/service/restaurant_service.dart';
import 'package:api_demo_restaurant/widgets/restaurant_item_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<RestaurantModel>> restaurantFuture;

  @override
  void initState() {
    super.initState();
    restaurantFuture = RestaurantService.instance.fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              child: Icon(Icons.search_sharp, color: Colors.grey),
            ),
            SizedBox(width: 26),
            Text(
              'Restaurants Near You',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 26),
            Icon(Icons.line_weight_sharp, color: Colors.grey),
          ],
        ),
      ),
      body: FutureBuilder<List<RestaurantModel>>(
        future: restaurantFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Comments Found'));
          }

          final restaurants = snapshot.data!;

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) =>
                RestaurantItemView(restaurant: restaurants[index]),
          );
        },
      ),
    );
  }
}
