import 'package:api_demo_restaurant/model/restaurant_model.dart';
import 'package:api_demo_restaurant/service/restaurant_service.dart';
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
        backgroundColor: Colors.grey[300],
        title: Row(
          children: [
            Icon(Icons.search_sharp,color: Colors.grey,),
            SizedBox(width: 26),
            Text('Restaurants Near You',style: TextStyle(fontWeight: FontWeight.w500),),
            SizedBox(width: 26),
            Icon(Icons.line_weight_sharp,color:Colors.grey)
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
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
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
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name ?? '',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  ' ${restaurant.distance ?? '2.0'} km away',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  restaurant.address ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[500],
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                  onPressed: (){}, 
                                  child:Text('View Detail',style: TextStyle(color: Colors.white),) )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                               (restaurant.rating ?? 0).toString(),
                               style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                               ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 28,
                              )
                            ],
                          )
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
