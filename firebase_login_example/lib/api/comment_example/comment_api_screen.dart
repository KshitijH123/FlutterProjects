import 'package:firebase_login_example/model/comment_model.dart';
import 'package:firebase_login_example/api/comment_example/comment_detail_screen.dart';
import 'package:firebase_login_example/services/comment_service.dart';
import 'package:flutter/material.dart';

class CommentApiScreen extends StatefulWidget {
  const CommentApiScreen({super.key});

  @override
  State<CommentApiScreen> createState() => _CommentApiScreenState();
}

class _CommentApiScreenState extends State<CommentApiScreen> {
  late Future<List<CommentModel>> commentFuture;

  @override
  void initState() {
    super.initState();
    commentFuture = CommentService.instance.fetchComment();
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
          'Comments',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: FutureBuilder<List<CommentModel>>(
        future: commentFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.teal,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No comments Found'));
          }

          final comments = snapshot.data!;
          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Card(
                color: Colors.grey[200],
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommentDetailScreen(comment: comment),
                      ),
                    );
                  },
                  title: Text(
                    '‣ ${comment.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '~ ${comment.email}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to read comment',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
