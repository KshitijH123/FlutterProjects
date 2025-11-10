import 'package:flutter/material.dart';
import 'package:todo_list_firebase/model/todo_item_model.dart';

class AddItem extends StatefulWidget {
  final TodoItemModel? existingItem; 

  const AddItem({super.key, this.existingItem});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final itemNameController = TextEditingController();
  final discriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingItem != null) {
      itemNameController.text = widget.existingItem!.title;
      discriptionController.text = widget.existingItem!.discription;
    }
  }

  void saveItem() {
    final itemName = itemNameController.text.trim();
    final discription = discriptionController.text.trim();

    if (itemName.isEmpty || discription.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
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
    final isEditing = widget.existingItem != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Item' : 'Add Item',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
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
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: saveItem,
            child: Text(
              isEditing ? 'Save Changes' : 'Add Item',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
