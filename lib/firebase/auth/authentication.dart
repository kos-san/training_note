// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:training_note/catalog/gender_cat.dart';
import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/user_info.dart';

///アカウント情報のサーバー連携用クラス
class Authentication {
  static final FirebaseAuth.FirebaseAuth _firebaseAuth = FirebaseAuth.FirebaseAuth.instance;
  static const String KEY_email = "メールアドレス";
  static const String KEY_password = "パスワード";
  static const String KEY_passConfirm = "確認用パスワード";
  static const String KEY_name = "名前";
  static const String KEY_gender = "性別";
  static const String KEY_birthday = "誕生日";
  static const String KEY_userInfo = "ユーザー情報";

  static const String VAL_OK = "OK";
  static const String VAL_NG = "NG";
  static const String VAL_AuthError = "Firebase登録エラー";

  ///ユーザ登録処理<br>
  ///■機能概要： ユーザ情報を登録する<br>
  ///■前提条件：　すべての入力情報がnull値でないこと。<br>
  ///■入力情報：<br>
  ///   String email -メールアドレス<br>
  ///   String password -パスワード<br>
  ///   String passwordConfirmation -パスワード（確認用）<br>
  ///   String name -ユーザー名<br>
  ///   String gender -性別<br>
  ///   String birthday -誕生日<br>
  ///<br>
  ///■返却値：<br>
  ///Map<String, dynamic> 返却値<br>
  ///&#009;       1.ユーザ登録ができた場合<br>
  ///&#009;&#009;   KEY: String result<br>
  ///&#009;&#009;   VAL: bool true<br>
  ///&#009;&#009;   KEY: String userInfo<br>
  ///&#009;&#009;   VAL: UserInfo 登録したユーザ情報<br>
  ///<br>
  ///&#009;       2.ユーザ情報に不正があった場合<br>
  ///&#009;&#009;   KEY: String result<br>
  ///&#009;&#009;   VAL: bool false<br>
  static Future<Map<String, dynamic>> signUp({required String email, required String password, required String passwordConfirm, required String name, required GenderCat gender, required String birthDay}) async {
    bool result = false;
    Map<String, dynamic> mapResult = {
      "result": result
    };

    AccountInfo newAccount = AccountInfo(email: email, password: password, passwordConfirmation: passwordConfirm);




  try {
      print("【Logger】--ユーザ登録開始[FirebaseAuth]--");
      var account = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      newAccount.setUid(account.user!.uid);

      print('【Logger】--ユーザ登録完了[FirebaseAuth]--');
      print("【Logger】--ユーザ登録開始[Firestore-User-]--");
    }on FirebaseAuth.FirebaseAuthException catch(e) {
    print('【Logger】 --ユーザ登録に失敗--');
      print('------エラーログ【START】------');
      print(e);
      print('------エラーログ【END】------');
      return mapResult;

    }

    UserInfo userInfo = UserInfo(name: name, gender: gender, birthDay: birthDay, accountInfo: newAccount);
    Users.create(userInfo);

    mapResult["userInfo"] = userInfo;
    return mapResult;
  }

  ///TODO ユーザの入力情報に関するエラーハンドリングを作成する
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