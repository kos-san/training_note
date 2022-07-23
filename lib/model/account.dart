import 'package:quiver/strings.dart';
import 'package:training_note/firebase/auth/authentication.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/user.dart';
import 'package:training_note/util/keys.dart';
import 'package:training_note/util/log.dart';


///アカウント管理用モデル<br>
///【項目】<br>
///・uid -ユーザ識別用のID<br>
///・email -ログイン用アドレス<br>
///・password -ログイン用パスワード<br>
class Account extends Model{
  String? uid;
  String? email;
  String? password;

  /// コンストラクタ
  Account({this.email = "", this.password = ""});

  ///アカウントを作成する<br>
  ///前提条件：<br>
  ///uid 必須<br>
  ///email 必須<br>
  ///password 必須<br>
  ///<br>
  ///@param User ユーザ情報<br>
  ///@param String 確認用パスワード<br>
  ///@return 登録OK bool TRUE<br>
  ///@return 登録NG bool FALSE<br>
  Future<dynamic> signUp({required User user, required String paswordConfirm}) async{

    Log.start(actionName: "ユーザ登録");

    var _result = await Authentication.signUp(account: this);

    if(!_result) {
      return _result;
    }

    _result = await user.create();

    if(!_result) {
      return false;
    }

    setValue(key: Keys.account, val: this);
    setValue(key: Keys.user, val: user);
    return true;
  }


  Future<dynamic> signIn() async{
    if(isBlank(email) || isBlank(password)) {
      return false;
    }

    var _result = await Authentication.signIn(account: this);

    if(!_result) {
      return false;
    }

    User user = User(accountId: uid);
    _result = await user.read();

    return true;
  }

  Map<String, dynamic> passwordValid(String _passwordConfirm) {
    Log.start(actionName: "パスワードチェック");
    String? _password = getValue(key: Keys.password);
    _password = "aa";

    bool result = true; //結果
    List<Keys> listNullChek =[]; //NULL値項目のキーを格納する
    bool isLengthCheck = true;
    bool isMatchCheck = true;

    if(null != _password) {
      if(_password.length < 5) {
        Log.NG(actionName: "パスワードチェック", detail: "文字数チェックNG");
        result = false;
        isLengthCheck = false;
      }

      print("【LOG】 --同一チェック【開始】--");
      if(_password.length != _passwordConfirm.length) {
        print("【LOG】 --判定結果【NG】--");
        result = false;
        isMatchCheck = false;
      }
    }


    Map<String, dynamic> mapDetails = {
      "nullCheck": listNullChek,
      "lengthCheck": isLengthCheck,
      "matchCheck": isMatchCheck
    };
    Map<String, dynamic> mapResult = {
      "result": result,
      "details": mapDetails
    };

    return mapResult;

  }

  @override
  Map<Keys, dynamic> getMap() {
    return {
      Keys.uid: uid,
      Keys.email: email,
      Keys.password: password
    };
  }

  @override
  setValue({required Keys key, required dynamic val}) {
    switch(key.getKeyName()) {
      case "uid":
        uid = val;
        break;
      case "password":
        password = val;
        break;
      case "email":
        email = val;
        break;
      default:
        Log.NG(actionName: "モデル項目のセット", detail: "対象キーなし");
        break;
    }
  }
}