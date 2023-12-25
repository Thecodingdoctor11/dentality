import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  // Private constructor to prevent instantiation from outside the class.
  AuthHelper._();

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Getter for the FirebaseAuth instance.
  static FirebaseAuth get instance => _firebaseAuth;

  // Custom method for user authentication (you can customize this based on your needs).
  static Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error signing in with email and password: $e");
      return null;
    }
  }

  static Future<UserCredential?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error signing in with email and password: $e");
      return null;
    }
  }

  static User? currentUser = _firebaseAuth.currentUser;
  // Custom method to sign out the current user.
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
