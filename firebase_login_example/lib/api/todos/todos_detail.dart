import 'package:firebase_login_example/model/todos_model.dart';
import 'package:flutter/material.dart';

class TodosDetail extends StatefulWidget {
  const TodosDetail({super.key, required this.todos});
  final TodosModel todos;

  @override
  State<TodosDetail> createState() => _TodosDetailState();
}

class _TodosDetailState extends State<TodosDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          'User Id : ${widget.todos.userId}',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                widget.todos.todo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Completed :',style: TextStyle(fontSize: 16),),
                  Checkbox(value: widget.todos.completed, onChanged: null)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
