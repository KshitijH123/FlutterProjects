import 'package:flutter/material.dart';
import 'package:todo_list_firebase/model/todo_item_model.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final itemNameController = TextEditingController();
  final discriptionController = TextEditingController();

  void saveItem() {
    final itemName = itemNameController.text.trim();
    final discription = discriptionController.text.trim();

    if (itemName.isEmpty && discription.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please Fill All The Field')));
      return;
    }

    TodoItemModel todoItemModel = TodoItemModel(
      title: itemName,
      discription: discription,
    );

    Navigator.pop(context, todoItemModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item'), centerTitle: true, elevation: 2),
      body: Column(
        spacing: 24,
        children: [
          TextField(
            controller: itemNameController,
            decoration: InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: discriptionController,
            decoration: InputDecoration(
              labelText: 'Discription',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(onPressed: saveItem, child: Text('Add Item')),
        ],
      ),
    );
  }
}
