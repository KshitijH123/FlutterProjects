class TodoModel {
  String? id;
  final String title;
  final String discription;

  TodoModel({this.id,required this.title, required this.discription});

  Map<String, dynamic> toJson() => {'title': title, 'discription': discription};

  factory TodoModel.fromJson(Map<dynamic, dynamic> json, String id) {
    return TodoModel(
      id:id,
      title: json['title'] as String? ?? '',
      discription: json['discription'] as String? ?? '',
    );
  }
}
