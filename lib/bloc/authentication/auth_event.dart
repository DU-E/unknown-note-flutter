abstract class AuthEvent {}

class AuthGoogleSigninEvent extends AuthEvent {}

class AuthKakaoSigninEvent extends AuthEvent {}

class AuthNaverSigninEvent extends AuthEvent {}

class AuthSignoutEvent extends AuthEvent {}

class AuthGetUserEvent extends AuthEvent {}
