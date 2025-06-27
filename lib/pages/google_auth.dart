import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('Starting Google Sign-In...');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print('Google user signed in: ${googleUser.email}');
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        print('Google authentication successful');
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        print('Signing in with Firebase...');
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        print('Firebase authentication successful. User: ${userCredential.user?.email}');
        return userCredential;
      } else {
        print('Google Sign-In cancelled by user');
        return null;
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
      rethrow; 
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
      rethrow; 
    }
  }
}