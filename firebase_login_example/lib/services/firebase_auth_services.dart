import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuthServices._();

  static final FirebaseAuthServices instance = FirebaseAuthServices._();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something Went Wrong";
    }
    return null;
  }

  Future<String?> loginUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something Went Wrong";
    }
  }
}
