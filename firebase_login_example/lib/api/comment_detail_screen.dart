import 'package:firebase_login_example/model/comment_model.dart';
import 'package:flutter/material.dart';

class CommentDetailScreen extends StatefulWidget {
  const CommentDetailScreen({super.key, required this.comment});
  final CommentModel comment;

  @override
  State<CommentDetailScreen> createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          '${widget.comment.email}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '‣ ${widget.comment.name ?? 'No Name'}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Email: ${widget.comment.email ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Divider(height: 30, thickness: 1),
                  Text(
                    '~ ${widget.comment.body ?? ''}',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Post Id: ${widget.comment.postId}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                   Text(
                    'Id: ${widget.comment.id}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
