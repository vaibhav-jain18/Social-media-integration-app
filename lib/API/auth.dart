import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tsf_social_media_integration/API/keys.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TwitterLogin _twitterLogin =
      TwitterLogin(consumerKey: consumerKey, consumerSecret: consumerSecret);

  Stream<User> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((User user) => user);

  Future<User> loginWithTwitter() async {
    final TwitterLoginResult loginResult = await _twitterLogin.authorize();
    if (loginResult.status == TwitterLoginStatus.loggedIn) {
      final TwitterSession twitterSession = loginResult.session;

      final AuthCredential twitterAuthCredential =
          TwitterAuthProvider.credential(
              accessToken: twitterSession.token, secret: twitterSession.secret);
      UserCredential usercredential = await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);
      return usercredential.user;
    }
    return null;
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
    final result = await _facebookLogin.logIn(['email']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }

  void logout() async {
    await _twitterLogin.logOut();
    await _facebookLogin.logOut();
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
