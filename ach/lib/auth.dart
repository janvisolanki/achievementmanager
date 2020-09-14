import 'package:ach/database.dart';
import 'package:ach/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseAuth(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseAuth);
  }

  // register with emain and password
  Future registerWithEmailAndPassword(
      String email, String password,  String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('name ' + name);
     
      FirebaseUser user = result.user;
      await DatabaseService().updateUserData(name, email,  user.uid);
      return _userFromFirebaseAuth(user);
    } catch (e) {
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseAuth(user);
    } catch (e) {
      return null;
    }
  }

  //log out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}