import 'dart:collection';
import 'dart:ffi';

// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/user_info.dart';

import 'package:training_note/util/keys.dart';

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

  static const String KEY_result = AccountInfo.KEY_result;
  static const String KEY_details = AccountInfo.KEY_details;

  ///ユーザ登録処理<br>
  ///■機能概要： ユーザ情報を登録する<br>
  ///■前提条件：　すべての入力情報がnull値でないこと。<br>
  ///■入力情報：<br>
  ///   String email -メールアドレス<br>
  ///   String password -パスワード<br>
  ///   String passwordConfirmation -パスワード（確認用）
  ///   String name -ユーザー名
  ///   String gender -性別
  ///   String birthday -誕生日
  ///<br>
  ///■返却値：<br>
  ///Map<String, dynamic> 返却値<br>
  ///&#009;       1.ユーザ登録ができた場合<br>
  ///&#009;&#009;   KEY: KEY_result<br>
  ///&#009;&#009;   VAL: VAL_OK -String<br>
  ///&#009;&#009;   KEY: KEY_userInfo<br>
  ///&#009;&#009;   VAL: 登録したユーザ情報 -UserModel<br>
  ///<br>
  ///&#009;       2.ユーザ情報に不正があった場合<br>
  ///&#009;&#009;   KEY: KEY_result<br>
  ///&#009;&#009;   VAL: VAL_NG -String<br>
  ///&#009;&#009;   KEY: KEY_details -String<br>
  ///&#009;&#009;   VAL: エラー詳細情報 -Map<br>
  ///&#009;&#009;&#009;   KEY: KEY_{email, password, passwordConfirm, name, gender, birthday} -String<br>
  ///&#009;&#009;&#009;   VAL: 各入力情報に対するエラー内容 -String<br>
  ///<br>
  ///&#009;       3.入力情報不正チェックは問題なかったが、Firebase登録中にエラーになった場合<br>
  ///&#009;&#009;   KEY: KEY_result<br>
  ///&#009;&#009;   VAL: VAL_AuthError -String<br>
  static dynamic signUp({required String email, required String password, required String passwordConfirm, required String name, required String gender, required String birthDay}) async {

    AccountInfo newAccount = AccountInfo(email: email, password: password, passwordConfirmation: passwordConfirm);

    Map mapResult = newAccount.registerJudge();
    bool _result = mapResult[KEY_result];

    if(!_result) {
      return mapResult;
    }

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
      _result = false;
    }

    UserInfo userInfo = UserInfo(name: name, gender: gender, birthDay: birthDay);
    userInfo.setAccount(newAccount);
    Users.createUser(userInfo);

    return userInfo;


  }


  /// ユーザ登録が可能かどうかを判定し、結果を返却する<br>
  /// <b>param:</b> Map&lt;String, dynamic&gt; ユーザ入力情報<br>
  /// <b>return:</b> Map&lt;String, dynamic&gt; result<br>
  ///   <b>&#009;ユーザ登録が可能な場合</b><br>
  ///   &#009;・KEY: Keys.result<br>
  ///   &#009;・VAL: true --bool<br>
  ///   <b>&#009;ユーザ登録に問題がある場合</b><br>
  ///   &#009;・KEY: Keys.result<br>
  ///   &#009;・VAL: false --Bool<br>
  ///   &#009;・KEY: Keys.details<br>
  ///   &#009;・VAL:  Map&lt;String, dynamic&gt; details<br>
  ///     &#009;&#009;・KEY: 入力情報.キー
  ///     &#009;&#009;・VAL: エラー理由 --String<br>
  static Map<String, dynamic> _isSignupValid(Map<String, dynamic> createUserDetails) {
    Map<String, dynamic> mapResult = {};    //返却用変数
    Map<String, dynamic> mapDetails = {};   //エラー理由詳細用

    bool blnResult = true;
    createUserDetails.forEach((key, value) {
      if(value == null || value == "") {
        blnResult = false;
        mapDetails[key] = "null";
      }
    });

    mapResult[Keys.result] = blnResult;
    if(!blnResult) {
      mapResult[Keys.details] = mapDetails;   //エラーが１件でもある場合はエラー詳細を返却する。
    }
    return mapResult;
  }
}