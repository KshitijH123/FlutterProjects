import 'package:flutter/material.dart';
import 'package:profile_api/model/screen_model.dart';
import 'package:profile_api/service/api_service.dart';

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
    profileFuture = ApiService.instance.fetchScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile',style: TextStyle(fontWeight: FontWeight.w500),),
        backgroundColor: Color.fromARGB(255, 99, 1, 234),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<ScreenModel?>(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final user = snapshot.data!.user;
          final stats = user.stats;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                ),
                const SizedBox(height: 12),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style:  TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                if (user.bio != null && user.bio!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      user.bio!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                const SizedBox(height: 16),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            stats.followers.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            stats.following.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Following',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            stats.posts.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Posts',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
