class PostsResponse {
  final List<PostsModel> posts;
  final int? total;
  final int? skip;
  final int? limit;

  PostsResponse({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) {
    return PostsResponse(
      posts: (json['posts'] as List)
          .map((e) => PostsModel.fromJson(e))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class PostsModel {
  final int? id;
  final String title;
  final String body;
  final List<String?> tags;
  final ReactionModel? reaction;
  final int? views;
  final int? userId;

  PostsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reaction,
    required this.views,
    required this.userId,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      reaction: json['reactions'] != null
          ? ReactionModel.fromJson(json['reactions'])
          : null,
      views: json['views'],
      userId: json['userId'],
    );
  }
}

class ReactionModel {
  final int? likes;
  final int? dislikes;

  ReactionModel({
    required this.likes, 
    required this.dislikes
    });

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      likes: json['likes'], 
      dislikes: json['dislikes']
    );
  }
}
