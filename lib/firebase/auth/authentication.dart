import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_note/util/json_manager.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? user;

  static Future<dynamic> signUp({String? email, String? password, String? passwordConfirmation, String? name, String? gender, String? birthDay}) async {
    HashMap _hmResult = _isSignupValid();
    if(email == "" || email == null || password == "" || password == null) {
      print("nullチェック！");
      return false;

  }
  try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        print('【Logger】--ユーザ登録完了--');
        return true;
    }on FirebaseAuthException catch(e) {
    print('【Logger】 --ユーザ登録に失敗--');
      print('------エラーログ【START】------');
      print(e);
      print('------エラーログ【END】------');
      return false;
    }
  }

  static HashMap<String, Object> _isSignupValid() {
    HashMap<String, Object> hmResult = HashMap();

    JsonManager jsonM = JsonManager("jj");
    return hmResult;
  }
}