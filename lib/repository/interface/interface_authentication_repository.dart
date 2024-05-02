import 'package:unknown_note_flutter/enums/enum_auth_method.dart';
import 'package:unknown_note_flutter/models/oauth2/oauth2_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

abstract interface class IAuthenticationRepository {
  Future<OAuth2Model> signinWithGoogle();

  Future<void> signoutWithGoogle();

  Future<OAuth2Model> signinWithKakao();

  Future<OAuth2Model> signinWithNaver();

  Future<void> signoutWithNaver();

  Future<ResModel<String>> dudeSignin({
    required EAuthMethod method,
    required String accessToken,
  });
}
