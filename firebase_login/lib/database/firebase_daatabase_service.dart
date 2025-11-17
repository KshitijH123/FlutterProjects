import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  FirebaseDatabaseService._();

  static final FirebaseDatabaseService instance = FirebaseDatabaseService._();

  final DatabaseReference db = FirebaseDatabase.instance.ref("User");

  Future<void> saveUserData({
    required String name,
    required String email,
  }) async {
    await db.push().set({
      "name": name,
      "email": email,
      "createdAt": DateTime.now().toString(),
    });
  }
}
