import 'package:firebase_login_example/api/comment_example/comment_api_screen.dart';
import 'package:firebase_login_example/api/posts_example/posts_screen.dart';
import 'package:firebase_login_example/api/product_example/products_screen.dart';
import 'package:firebase_login_example/api/quote_example/quotes_screen.dart';
import 'package:firebase_login_example/api/recipe_example/recipes_screen.dart';
import 'package:firebase_login_example/api/restaurant_example/restaurant_screen.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          'Data Screen',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommentApiScreen()),
                );
              },
              child: Text('Comments', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotesScreen()),
                );
              },
              child: Text('Quotes', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              child: Text('Products', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostsScreen()),
                );
              },
              child: Text('Posts', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipesScreen()),
                );
              },
              child: Text('Recipes', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantScreen()),
                );
              },
              child: Text('Restaurant', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
