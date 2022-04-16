import 'dart:collection';
import 'dart:ffi';

import 'package:training_note/model/model.dart';

///ユーザ情報（Auth）専用のクラス
class AccountInfo extends Model{
  String uid;
  String email;
  String password;
  String passwordConfirmation;

  static const String KEY_uid = "uid";
  static const String KEY_email = "メールアドレス";
  static const String KEY_password = "パスワード";
  static const String KEY_passConfirm = "確認用パスワード";

  static const String KEY_result = "結果";
  static const String KEY_details = "結果詳細";

  ///パスワードとパスワード（確認用）が一致しなかった時のエラー返却値
  static const String VAL_incorrectPassword = "パスワード不正";
  ///パスワードの文字数が5文字以下だった場合のエラー返却値
  static const String VAL_passwordCount = "パスワード文字数（5文字以下）";
  ///メールアドレスの形式が不正だった場合のエラー返却値
  static const String VAL_emailFormat = "メールアドレス形式不正";

  AccountInfo({this.uid = "",this.email = "", this.password = "", this.passwordConfirmation = ""});

  ///■処理概要：　キーを元に、登録したユーザ情報の値を取得する
  ///■前提条件：　ログインをしていること
  String? getValue(String key) {
    return _getMap()[key];
  }

  setUid(String uid) {
    this.uid = uid;
  }

  ///■処理概要：　ユーザ情報の値をMapへ格納して返却する<br>
  ///返却するMapの値はString型
  Map<String, String> _getMap() {
    return {
      KEY_uid: uid,
      KEY_email: email,
      KEY_password: password,
      KEY_passConfirm: passwordConfirmation
    };
  }

  Map registerJudge() {
    Map mapResult = {
      KEY_result: true
    };

    //入力情報が不正だった場合にエラー理由を格納するエラーリスト
    Map mapDetails = {};

    if(password.length < 6) {
      //パスワードが5文字以下だった場合のエラー情報
      mapDetails[KEY_password] = VAL_passwordCount;
    }else if(password != passwordConfirmation) {
      //パスワード（確認用）がパスワードと一致しなかった場合のエラー情報
      mapDetails[KEY_passConfirm] = VAL_incorrectPassword;
    }

    List<String> splEmail = email.split("");
    bool atCheck = false;
    bool datCheck = false;
    for (var str in splEmail) {
      if(str == "@") {
        atCheck = true;
      }
      else if(str == ".") {
        datCheck = true;
      }
      if(atCheck && datCheck) {
        break;
      }
    }
    if(!(atCheck && datCheck)) {
      //メールアドレスの形式が不正だった場合のエラー情報
      mapDetails[KEY_email] = VAL_emailFormat;
    }

    if(mapDetails.isNotEmpty) {
      mapResult[KEY_result] = false;
      mapResult[KEY_details] = mapDetails;
    }

    return mapResult;
  }

}