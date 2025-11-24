import 'package:api_demo_restaurant/model/restaurant_model.dart';
import 'package:api_demo_restaurant/restaurant_detail_screen.dart';
import 'package:api_demo_restaurant/service/restaurant_service.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<RestaurantModel> restaurantList = [];
  List<RestaurantModel> filteredList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    restaurantList = await RestaurantService.instance.fetchRestaurant();

    setState(() {
      filteredList = restaurantList;
      isLoading = false;
    });
  }

  void filterSearch(String query) {
    List<RestaurantModel> result = [];
    if (query.isEmpty) {
      result = restaurantList;
    } else {
      result = restaurantList
          .where(
            (item) => item.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      filteredList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: filterSearch,
            decoration: InputDecoration(
              labelText: 'Search restaurants...',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredList.isEmpty
          ? const Center(child: Text("No restaurant found"))
          : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final restaurant = filteredList[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      restaurant.image!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(restaurant.name!),
                  subtitle: Text("${restaurant.address}"),
                  trailing: Text(
                    '⭐ ${restaurant.rating}',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailScreen(restaurant: restaurant),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
