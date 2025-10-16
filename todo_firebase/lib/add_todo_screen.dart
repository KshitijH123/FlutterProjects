import 'package:flutter/material.dart';
import 'package:todo_firebase/model/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleController = TextEditingController();
  final discriptionController = TextEditingController();

  void addTodo() {
    final title = titleController.text.trim();
    final discription = discriptionController.text.trim();

    if (title.isEmpty || discription.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('please fill all the fields')));
      return;
    }

    final todoModel = TodoModel(title: title, discription: discription, id: '');

    Navigator.pop(context, todoModel);
  }

  @override
  void dispose() {
    titleController.dispose();
    discriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'Add Todo',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: discriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: 'Discription',
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[300],
              foregroundColor: Colors.white,
              minimumSize: Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: addTodo,
            child: Text('Add item', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
