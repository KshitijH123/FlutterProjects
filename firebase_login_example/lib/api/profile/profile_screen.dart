import 'package:firebase_login_example/model/screen_model.dart';
import 'package:firebase_login_example/services/profile_services.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ScreenModel?> profileFuture;

  @override
  void initState() {
    super.initState();
    profileFuture = ProfileServices.instance.fetchScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 1, 234),
        foregroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text('User Profile',style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: FutureBuilder<ScreenModel?>(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final user = snapshot.data!.user;
          final stats = user.stats;

          return Center(
            child: Column(
              children: [
                SizedBox(height: 24),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                const SizedBox(height: 12),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    user.bio,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            stats.followers.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            stats.following.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            stats.posts.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 7,color: Colors.grey.shade200)
              ],
            ),
          );
        },
      ),
    );
  }
}
