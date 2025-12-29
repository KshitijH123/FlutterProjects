class ScreenModel {
  final String title;
  final User user;

  ScreenModel({required this.title, required this.user});

  factory ScreenModel.fromJson(Map<String, dynamic> json) {
    return ScreenModel(title: json['title'], user: User.fromJson(json['user']));
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String bio;
  final Stats stats;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.bio,
    required this.stats,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      bio: json['bio'],
      stats: Stats.fromJson(json['stats']),
    );
  }
}

class Stats {
  final int followers;
  final int following;
  final int posts;

  Stats({
    required this.followers,
    required this.following,
    required this.posts,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      followers: int.parse(json['followers'].toString()),
      following: int.parse(json['following'].toString()),
      posts: int.parse(json['posts'].toString()),
    );
  }
}
