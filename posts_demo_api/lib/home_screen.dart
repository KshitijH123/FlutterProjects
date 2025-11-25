import 'package:flutter/material.dart';
import 'package:posts_demo_api/model/posts_model.dart';
import 'package:posts_demo_api/post_detail_screen.dart';
import 'package:posts_demo_api/service/posts_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PostsResponce> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = PostsServices.instance.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: FutureBuilder<PostsResponce>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final posts = snapshot.data!.posts;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      (MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      )),
                    );
                  },
                  leading: Text(
                    ' ${post.id ?? ""} -',
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text(post.title),
                  trailing: Text(
                    '👁 ${post.views ?? 0}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
