abstract class LoginEvents {}

class AuthenticateUserLoginEvent implements LoginEvents {
  final String email;
  final String pass;

  AuthenticateUserLoginEvent(this.email, this.pass);
}

class FetchUserLoginEvent implements LoginEvents {
  final String uid;

  FetchUserLoginEvent(this.uid);
}