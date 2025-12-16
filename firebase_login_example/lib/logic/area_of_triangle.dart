import 'package:firebase_login_example/model/triangle_model.dart';
import 'package:flutter/material.dart';

class AreaOfTriangle extends StatefulWidget {
  const AreaOfTriangle({super.key});

  @override
  State<AreaOfTriangle> createState() => _AreaOfTriangleState();
}

class _AreaOfTriangleState extends State<AreaOfTriangle> {
  double area = 0;
  List<Triangle> history = [];

  final heightController = TextEditingController();
  final widthController = TextEditingController();

  void calculateArea() {
    final heightStr = heightController.text.trim();
    final height = double.tryParse(heightStr) ?? 0;
    final widthStr = widthController.text.trim();
    final width = double.tryParse(widthStr) ?? 0;

    area = 0.5 * height * width;

    final triangle = Triangle(height: height, width: width, area: area);

    if (history.length >= 5) {
      history.removeAt(0);
    }

    history.add(triangle);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          'Area Of Triangle',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              const Center(
                child: Icon(
                  Icons.change_history,
                  size: 200,
                  color: Colors.teal,
                ),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              TextField(
                controller: widthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Width',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[200],
                    foregroundColor: Colors.white,
                    minimumSize: Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: calculateArea,
                  child: Text('Calculate Area', style: TextStyle(fontSize: 18)),
                ),
              ),
              Text(
                'Area Of Triangle: ${area.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              Text('History:', style: TextStyle(fontSize: 18)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final triangle = history[index];
                  return Text(
                    'height: ${triangle.height},width: ${triangle.width},area: ${triangle.area},',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
