import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((User user) => user);

  Future<String> loginWithTwitter() async {
    //
  }

  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) return null;
    final GoogleSignInAuthentication _googleAuth =
        await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User> loginWithFaceBook() async {
    try {
      final result = await _facebookLogin.logIn(['email']);
      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("EXCEPTION: $e");
      return null;
    }
  }

  void logout() async {
    //
    await _facebookLogin.logOut();
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
