import 'package:flutter/material.dart';
import 'package:triangle_app/model/triangle_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double area = 0;
  List<Triangle> history = [];

  final heightController = TextEditingController();
  final widthController = TextEditingController();

  void calculateArea() {
    final heigthStr = heightController.text.trim();
    final height = double.tryParse(heigthStr) ?? 0;
    final widthStr = widthController.text.trim();
    final width = double.tryParse(widthStr) ?? 0;

    area = 1 / 2 * height * width;
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              const Center(child: Text('▲', style: TextStyle(fontSize: 132))),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              TextField(
                controller: widthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Width',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Area Of Triangle: $area',
                style: TextStyle(fontSize: 18),
                maxLines: 2,
              ),
              SizedBox(height: 4),
              Text('History: ', style: TextStyle(fontSize: 18)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final triangle = history[index];
                  return Text(
                    'height:${triangle.height}, width: ${triangle.width}, area: ${triangle.area} ',
                  );
                },
              ),
              ElevatedButton(
                onPressed: calculateArea,
                child: const Text('Calculate Area'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
