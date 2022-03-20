import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? user;

  static Future<dynamic> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print('【Logger】--ユーザ登録完了--');
      return true;
    }on FirebaseAuthException catch(e) {
      print('【Logger】 --ユーザ登録に失敗--');
      return false;
    }
  }
}