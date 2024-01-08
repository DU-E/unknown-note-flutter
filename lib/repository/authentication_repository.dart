import 'package:google_sign_in/google_sign_in.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';

class AuthenticationRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid',
      'email',
    ],
  );

  Future<OAuth2Model> signinWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      throw Exception('Google Sign-In was canceled');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    if (googleAuth.accessToken == null) {
      throw Exception('Failed to get AccessToken');
    }
    if (googleAuth.idToken == null) {
      throw Exception('Failed to get IdToken');
    }

    return OAuth2Model(
      token: googleAuth.accessToken!,
      id: googleAuth.idToken!,
    );
  }

  Future<void> signoutWithGoogle() async {
    await _googleSignIn.signOut();
    return;
  }
}
