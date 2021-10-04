import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on fireBase user
  AccountUser _userFromFireBaseUser(User user) {
    return user != null ? AccountUser(uid: user.uid) : null;
  }

  //change user stream
  Stream<AccountUser> get userInstance {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFireBaseUser(user));
        .map(_userFromFireBaseUser);
  }

  // signin anonymous
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signin and email and pass

  // register email and pass
  Future registerEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
