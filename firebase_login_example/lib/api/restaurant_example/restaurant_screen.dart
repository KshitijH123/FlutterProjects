import 'package:firebase_login_example/model/restaurant_model.dart';
import 'package:firebase_login_example/services/restaurant_service.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late Future<List<RestaurantModel>> restaurantFuture;

  @override
  void initState() {
    super.initState();
    restaurantFuture = RestaurantService.instance.fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Recipes',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<RestaurantModel>>(
        future: restaurantFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Restaurants Found'));
          }

          final restaurants = snapshot.data!;

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        restaurant.image ?? '',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${restaurant.distance ?? '2.0'} away',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  restaurant.address ?? '',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'View Detail',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                (restaurant.rating ?? 0).toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 28,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
