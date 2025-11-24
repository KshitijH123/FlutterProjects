class QuotesModel {
  final int id;
  final String quote;
  final String author;

  QuotesModel({required this.id, required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
