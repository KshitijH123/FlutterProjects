import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/add_todo_screen.dart';
import 'package:todo_firebase/model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseReference todosRef = FirebaseDatabase.instance.ref('todos');
  List<TodoModel> todoItems = [];

  @override
  void initState() {
    super.initState();
    todosRef.onValue.listen(
      (event) {
        final data = event.snapshot.value;
        final List<TodoModel> items = [];
        if (data != null && data is Map) {
          data.forEach((key, value) {
            if (value is Map) {
              items.add(TodoModel.fromJson(value, key));
            }
          });
        }
        setState(() {
          todoItems = items;
        });
      },
      onError: (error) {
        debugPrint('FireBase DB listen error: $error');
      },
    );
  }

  void deleteTodo(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                  setState(() {
                    todoItems.removeAt(index);
                  });
                
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (context, index) {
                      final item = todoItems[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.discription),
                            trailing: InkWell(
                              onTap: () => deleteTodo(index),
                              child: Icon(Icons.delete),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () async {
          final result = await Navigator.push<TodoModel>(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );

          if (result != null) {
            try {
              final newRef = todosRef.push();

              final todoWithId = TodoModel(
                id: newRef.key,
                title: result.title,
                discription: result.discription,
              );

              setState(() {
                todoItems.add(todoWithId);
              });

              await newRef.set(result.toJson());

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Todo added successfully!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to add todo: $e')),
                );
              }
            }
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
