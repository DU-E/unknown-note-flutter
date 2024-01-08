import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';

class AuthenticationRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email'],
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
    // if (googleAuth.idToken == null) {
    //   throw Exception('Failed to get IdToken');
    // }

    return OAuth2Model(
      token: googleAuth.accessToken!,
      // id: googleAuth.idToken!,
    );
  }

  Future<void> signoutWithGoogle() async {
    await _googleSignIn.signOut();
    return;
  }

  Future<OAuth2Model> signinWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        final kakaoToken = await UserApi.instance.loginWithKakaoTalk();

        return OAuth2Model(
          token: kakaoToken.accessToken,
          // id: googleAuth.idToken!,
        );
      } catch (e) {
        if (e is PlatformException && e.code == 'CANCELED') {
          throw Exception('Kakao Sign-In was canceled');
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        final kakaoToken = await UserApi.instance.loginWithKakaoAccount();

        return OAuth2Model(
          token: kakaoToken.accessToken,
          // id: googleAuth.idToken!,
        );
      }
    } else {
      final kakaoToken = await UserApi.instance.loginWithKakaoAccount();

      return OAuth2Model(
        token: kakaoToken.accessToken,
        // id: googleAuth.idToken!,
      );
    }
  }
}
