import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class AuthProvider {
  final twitterLogin = TwitterLogin(
    consumerKey: '94dfxel253BwSWHP8i3of2Fr8',
    consumerSecret: '9H6PAAnF3P2YjK1WqQyZfW2W7kqkdOXGK4RgWpD0RT55t72Ygk',
  );

  Future<String> loginWithTwitter() async {
    //
  }

  Future<String> loginWithGoogle() async {
    //
  }

  void logout() async {
    await twitterLogin.logOut();
  }
}
