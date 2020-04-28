import 'package:firebase_auth/firebase_auth.dart';
import 'package:arenaofvalor/Services/DataService.dart';
import 'package:arenaofvalor/models/User.dart';

class AuthService {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  User _getUserFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future statut() async {
    return _getUserFromFirebaseUser(await _fireAuth.currentUser());
  }

  Future signIn(email, password) async {
    try {
      AuthResult result = await _fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signUp(email, password) async {
    try {
      AuthResult result = await _fireAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      DatabaseService data = DatabaseService(uid: user.uid);
      await data.initial();

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _fireAuth.signOut();
      return 'signed out';
    } catch (e) {
      print(e);
      return null;
    }
  }
}
