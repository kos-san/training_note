
import 'package:training_note/model/user_info.dart';

class Keys {
  late String keyName;
  late dynamic clazz;

  ///キー情報：　メールアドレス
  static const String email = "email";
  ///キー情報：　名前
  static const String name = "name";
  ///キー情報；　パスワード
  static const String password = "password";
  ///キー情報：　パスワード（確認用）
  static const String passConfirm = "passConfirm";
  ///キー情報：　性別
  static const String gender = "gender";
  ///キー情報：　誕生日
  static const String birthDay = "birthDay";
  ///キー情報：　結果
  static const String result = "結果";
  ///キー情報：　結果詳細
  static const String details = "結果詳細";
  ///キー情報：　ユーザ情報
  static Keys userInfo = Keys("userInfo", UserInfo);

  Keys(String key, dynamic model) {
    keyName = key;
    clazz = model;
  }

}
