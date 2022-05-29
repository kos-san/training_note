// ignore_for_file: constant_identifier_names
import 'package:training_note/firebase/auth/authentication.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_keys.dart';

///ユーザ情報（Auth）専用のクラス
class AccountInfo extends Model{
  String uid;
  String email;
  String password;

  static const String modelName = "accountIfo";
  /// テーブルカラム定義
  static const String KEY_uid = "uid";
  static const String KEY_email = "メールアドレス";
  static const String KEY_password = "パスワード";

  AccountInfo({this.uid = "",this.email = "", this.password = ""}) {
    setModel(modelKey: ModelKeys.accountInfo, model: this);
  }

  setUid(String uid) {
    this.uid = uid;
  }

  ///■処理概要：　ユーザ情報の値をMapへ格納して返却する<br>
  @override
  Map<String, dynamic> getMap() {
    return {
      KEY_uid: uid,
      KEY_email: email,
      KEY_password: password
    };
  }

  ///■機能概要：　メールアドレスが有効か確認する機能<br>
  ///■入力情報：　String email　メールアドレス<br>
  ///■返却情報：　Future<Map<String, dynamic>><br>
  ///&#009; 1.KEY: String result <br>
  ///&#009; 　VAL: bool result {true, false} <br>
  ///&#009; 2.KEY: String detail <br>
  ///&#009; 　VAL: String メールアドレスが登録できない場合のエラー理由<br>
  static Future<Map<String, dynamic>> emailCheck({String email = ""}) async{
    bool result = true;
    String detail = "";

    if(email.isEmpty) {
      result = false;
      detail = "メールアドレスを入力してください";
    }
    else if(!_isEmailValid(email)) {
      result = false;
      detail = "メールアドレスの形式が正しくありません";
    }
    else {
      try {
        var _result = await Authentication.emailCheck(email: email);
        if(!_result) {
          result = false;
          detail = "メールアドレスが重複しています";
        }
      } catch(e) {
        result = false;
        detail = "その他エラー（サーバ接続エラー）";
      }
    }
    Map<String, dynamic> mapResult = {
        "result": result,
        "detail": detail
      };
    return mapResult;
  }

  static bool _isEmailValid(String email) {
    if (RegExp(r'^[0-9a-z_./?-]+@([0-9a-z-]+\.)+[0-9a-z-]+$')
        .hasMatch(email)) {
      return true;
    }

    return false;
  }

  static Future<Map<String, dynamic>> passwordCheck({String password = "", String passwordConfirmation = ""}) async{
    bool result = true;
    String detail = "";
    Map<String, dynamic> mapResult = {
      "result": result,
      "detail": detail
    };

    if(password.isEmpty) {
      result = false;
      detail = "パスワードを入力してください";
    }
    else if(password.length < 6) {
      result = false;
      detail = "パスワードは6文字以上で入力してください";
    }
    else if(passwordConfirmation.isEmpty || password != passwordConfirmation) {
      result = false;
      detail = "パスワードが一致しません";
    }

    return mapResult;
  }
}