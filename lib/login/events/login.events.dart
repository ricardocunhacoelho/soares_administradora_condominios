abstract class LoginEvents {}

class AuthenticateHomeUnitLoginEvent implements LoginEvents {
  final String email;
  final String pass;

  AuthenticateHomeUnitLoginEvent(this.email, this.pass);
}

class FetchHomeUnitLoginEvent implements LoginEvents {
  final String uid;

  FetchHomeUnitLoginEvent(this.uid);
}