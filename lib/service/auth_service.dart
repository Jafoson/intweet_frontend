import "package:firebase_auth/firebase_auth.dart";
import 'package:intweet_aplikation/service/database_services.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailandPassword(
      String userName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        await DatabaseService(uid: user.uid).updateUserData(userName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }
}
