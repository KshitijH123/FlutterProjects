import 'package:firebase_login_example/model/products_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductsModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
          widget.product.category,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Card(
        margin: EdgeInsets.all(12),
        color: Colors.teal[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                widget.product.image,
                height: 250,
                width: double.infinity,
              ),
            ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Text(
                widget.product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                '~${widget.product.description }',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
             SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '⭐ ${widget.product.rating.rate }',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '👤 ${widget.product.rating.count}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '₹ ${widget.product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
