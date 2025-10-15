import 'package:flutter/material.dart';
import 'package:todo_firebase/add_todo_screen.dart';
import 'package:todo_firebase/model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todoItems = [];

  void deleteTodo(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete item'),
          content: const Text('Are you sure you want to delet this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                todoItems.removeAt(index);
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text('Delete'),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
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
          final item = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );

          todoItems.add(item);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
