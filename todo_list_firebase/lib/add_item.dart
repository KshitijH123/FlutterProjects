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

    if (itemName.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please Fill All The Field')));
      return;
    }else if (discription.isEmpty){
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
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: discriptionController,
              decoration: InputDecoration(
                labelText: 'Discription',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: saveItem,
            child: Text('Add Item',style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
