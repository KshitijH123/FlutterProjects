import 'package:firebase_login_example/model/rectangle_model.dart';
import 'package:flutter/material.dart';

class AreaOfRectangle extends StatefulWidget {
  const AreaOfRectangle({super.key});

  @override
  State<AreaOfRectangle> createState() => _AreaOfRectangleState();
}

class _AreaOfRectangleState extends State<AreaOfRectangle> {
  final heightController = TextEditingController();
  final widthController = TextEditingController();
   
   double area = 0;
  List<RectangleModel> history = [];

  void calculateArea(){
      final height = double.tryParse(heightController.text.trim()) ?? 0;
      final width = double.tryParse(widthController.text.trim()) ?? 0;

      area = height * width;

      final rectangle = RectangleModel(height: height, width: width, area: area);

      if (history.length >= 5) {
        history.removeAt(0);
      }

      history.add(rectangle);
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
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              const Center(
                child: Text(
                  '𓊌',
                  style: TextStyle(fontSize: 200, color: Colors.teal),
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
                 const SizedBox(height: 20),

              Text(
                'Area Of Rectangle: $area',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),

              const Text('History:', style: TextStyle(fontSize: 18)),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final rectangle = history[index];
                  return Text(
                    'height: ${rectangle.height}, width: ${rectangle.width}, area: ${rectangle.area}',
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
