import 'package:flutter/material.dart';
import 'package:todo_list_firebase/add_item.dart';
import 'package:todo_list_firebase/model/todo_item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoItemModel> todoItems = [];

  void deleteTodoItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                todoItems.removeAt(index);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = todoItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(item.discription),
                      trailing: InkWell(
                        onTap: () {
                          deleteTodoItem(index);
                        },
                        
                        child: Icon(Icons.delete, color: Colors.red[400]),
                        
                      ),
                    ),
                  ),
                );
              },
              itemCount: todoItems.length,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final item = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItem()),
          );

          todoItems.add(item);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

