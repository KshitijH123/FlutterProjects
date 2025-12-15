import 'package:firebase_login_example/model/recipes_model.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
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
          '🧾 ${widget.recipe.name}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.network(
                widget.recipe.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '⭐ ${widget.recipe.rating ?? 0}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${widget.recipe.reviewCount ?? 0} Reviews',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (widget.recipe.cuisine != null)
                        Chip(
                          label: Text(widget.recipe.cuisine!),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      if (widget.recipe.difficulty != null)
                        Chip(
                          label: Text(widget.recipe.difficulty!),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      if (widget.recipe.mealType != null)
                        ...widget.recipe.mealType!.map(
                          (e) => Chip(
                            label: Text(e),
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.timer, color: Colors.teal),
                          SizedBox(height: 4),
                          const Text(
                            'Prep',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            '${widget.recipe.prepTimeMinutes ?? 0}min',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.teal,
                          ),
                          SizedBox(height: 4),
                          const Text(
                            'Cook',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            '${widget.recipe.cookTimeMinutes ?? 0}min',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.restaurant, color: Colors.teal),
                          SizedBox(height: 4),
                          const Text(
                            'Serving',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            '${widget.recipe.servings ?? 0}',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (widget.recipe.caloriesPerServing != null)
                    Row(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.red),
                        const SizedBox(width: 6),
                        Text(
                          '${widget.recipe.caloriesPerServing} Kcal per serving',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  if (widget.recipe.tags != null ||
                      widget.recipe.tags!.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: widget.recipe.tags!
                          .map(
                            (tag) => Chip(
                              label: Text(tag),
                              backgroundColor: Colors.teal.shade50,
                            ),
                          )
                          .toList(),
                    ),
                  const SizedBox(height: 24),
                  Text(
                    '➢ Ingridients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...widget.recipe.ingredients!.map(
                    (item) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8, color: Colors.teal),
                          const SizedBox(width: 8),
                          Expanded(child: Text(item)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    '➢ Instructions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...widget.recipe.instructions!.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.teal,
                            child: Text(
                              '${entry.key + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Text(entry.value)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
