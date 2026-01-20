import 'package:firebase_login_example/api/todos/todos_detail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login_example/model/todos_model.dart';
import 'package:firebase_login_example/services/todos_services.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late Future<List<TodosModel>> todosFuture;

  @override
  void initState() {
    super.initState();
    todosFuture = TodosServices.instance.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Todos',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<TodosModel>>(
        future: todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Todos Found'));
          }

          final todos = snapshot.data!;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodosDetail(todos: todo)),
                    );
                  },
                  title: Text('➢ ${todo.todo}', style: TextStyle(fontSize: 16)),
                  subtitle: Text('User ID: ${todo.userId}'),
                  trailing: Checkbox(value: todo.completed, onChanged: null),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
