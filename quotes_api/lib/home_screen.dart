import 'package:flutter/material.dart';
import 'package:quotes_api/model/quotes_model.dart';
import 'package:quotes_api/quote_detail_screen.dart';
import 'package:quotes_api/service/quotes_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<QuotesModel>> quoteFuture;

  @override
  void initState() {
    super.initState();
    quoteFuture = QuotesService.instance.fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: FutureBuilder<List<QuotesModel>>(
        future: quoteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Found'));
          } else {
            final quotes = snapshot.data!;

            return ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuoteDetailScreen(quote: quote),
                        ),
                      );
                    },
                    title: Text(
                      '𓂃🖊 ${quote.author}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      '💭 ${quote.quote}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
