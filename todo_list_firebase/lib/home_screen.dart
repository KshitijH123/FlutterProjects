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
      appBar: AppBar(title: const Text('Todo List'),centerTitle: true,elevation: 2,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = todoItems[index];

                return Card(
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.discription),
                    trailing: InkWell(
                      onTap: () {
                        deleteTodoItem(index);
                      },
                      child: Icon(Icons.delete),
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
