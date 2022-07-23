// ignore_for_file: constant_identifier_names, avoid_print, library_prefixes

import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:quiver/strings.dart';
import 'package:training_note/catalog/gender_cat.dart';
import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/user.dart';
import 'package:training_note/util/log.dart';

import '../../util/keys.dart';

///アカウント情報のサーバー連携用クラス
class Authentication {
  static final FirebaseAuth.FirebaseAuth _firebaseAuth = FirebaseAuth.FirebaseAuth.instance;

  static Future<dynamic> signUp({required Model account}) async {
    String email = account.getValue(key: Keys.email);
    String password = account.getValue(key: Keys.password);

    try {
      print("【LOG】 --アカウント登録【開始】[FirebaseAuth.signUp]--");
      var userAccount = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    } on Exception catch(e){
      Log.error(exception: e);
      return false;
    }

    return true;
  }

  // static Future<dynamic> update({required Model user}) async{
  //   var userAccount = await _firebaseAuth.
  // }

  static Future<dynamic> signIn({required Model account}) async{
    bool result = false;

    String _email = account.getValue(key: Keys.email);
    String _password = account.getValue(key: Keys.password);

    try {
      final FirebaseAuth.UserCredential _result =
          await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);

      String uid = _result.user!.uid;
      account.setValue(key: Keys.uid, val: uid);

    }on Exception catch(e) {
      Log.error(exception: e);
      return false;
    }

    return true;

  }

  static Future<Map<String, dynamic>> authCheck({String? email, String? password, String? passwordConfirm, String? name, GenderCat? genderCat, String? birthDay}) async{
    Map<String, dynamic> mapDetails = {
      "email": "",
      "password": "",
      "passwordConfirmation": "",
      "name": "",
      "gender": "",
      "birthDay": ""
    };
    Map<String, dynamic> mapResult = {
      "result": true,
      "details": mapDetails
    };

    return mapResult;
  }

  /// メールアドレスが重複していないか確認する機能
  static Future<bool> emailCheck({required String email}) async{

    var _result = await _firebaseAuth.fetchSignInMethodsForEmail(email);

    if(_result.isNotEmpty) {
      return false;
    }
    return true;
  }
}