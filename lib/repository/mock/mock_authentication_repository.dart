import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/mixins/mock_throw_exception_mixin.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';
import 'package:unknown_note_flutter/repository/interface/interface_authentication_repository.dart';

class MockAuthenticationRepository
    with MockThrowExceptionMixin
    implements IAuthenticationRepository {
  final int delay;
  final int? errorCode;

  MockAuthenticationRepository({
    this.delay = 1000,
    this.errorCode,
  });

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email'],
  );

  @override
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

  @override
  Future<void> signoutWithGoogle() async {
    await _googleSignIn.signOut();
    return;
  }

  @override
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

  @override
  Future<OAuth2Model> signinWithNaver() async {
    NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.error) {
      throw Exception('Failed to get AccessToken');
    }
    if (result.status == NaverLoginStatus.cancelledByUser) {
      throw Exception('Naver Sign-In was canceled');
    }

    NaverAccessToken accessToken = await FlutterNaverLogin.currentAccessToken;

    return OAuth2Model(token: accessToken.accessToken);
  }

  @override
  Future<void> signoutWithNaver() async {
    await FlutterNaverLogin.logOut();
    return;
  }

  @override
  Future<ResModel<String>> dudeSignin({
    required EAuthMethod method,
    required String accessToken,
  }) async {
    await Future.delayed(Duration(milliseconds: delay));

    return mockedResponse<ResModel<String>>(
      () {
        var resTmp = ResModel<String>(
          code: 1000,
          data: 'test_jwt_token',
        ).toJson((token) => token.toString());

        var res = ResModel<String>.fromJson(
          resTmp,
          (json) => json.toString(),
        );

        return res;
      },
      errorCode: errorCode,
    );
  }
}
