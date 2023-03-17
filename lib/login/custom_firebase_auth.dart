import 'package:firebase_auth/firebase_auth.dart';
import 'package:soares_administradora_condominios/login/auth.result.dart';
import 'package:soares_administradora_condominios/login/auth_interface.dart';

class CustomFirebaseAuth implements AuthInterface {
  CustomFirebaseAuth.internal();
  static final CustomFirebaseAuth _singleton = CustomFirebaseAuth.internal();
  factory CustomFirebaseAuth() => _singleton;
  @override
  Future<AuthResult> login(String user, String pass) async {
    if (_isValidsInputs(user, pass)) {
      try {
        var result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: user, password: pass);
         if(result.user != null)
             {
              return AuthResult();}
            else {return AuthResult(msgError: 'Not Authenticaded');}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return AuthResult(msgError: 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          return AuthResult(msgError: 'Wrong password provided for that user.');
        }
      }
    }
    return AuthResult(msgError: 'Not Authenticaded, invalid Inputs');
  }

  @override
  Future<AuthResult> register(String user, String pass) async {
    if (_isValidsInputs(user, pass)) {
      try {
        var userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: user, password: pass);
        return userCredential.user != null
            ? AuthResult()
            : AuthResult(msgError: 'Not Authenticaded');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return AuthResult(msgError: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          return AuthResult(
              msgError: 'The account already exist for that email.');
        }
      } catch (e) {
        return AuthResult(msgError: e.toString());
      }
    }
    return AuthResult(msgError: 'Not Register, Invalid Inputs');
  }

  bool _isValidsInputs(String user, String pass) =>
      user.isNotEmpty && pass.isNotEmpty && pass.length >= 6;
}
