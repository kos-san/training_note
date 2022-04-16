import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/model.dart';
/// ユーザ情報を保持するモデル
class UserInfo extends Model{
  late String userId;
  late String name;
  late String gender;
  late String birthDay;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  AccountInfo? accountInfo;

  static const String KEY_name = "名前";
  static const String KEY_gender = "性別";
  static const String KEY_birthday = "生年月日";
  static const String KEY_createdTime = "作成日";
  static const String KEY_updatedTime = "更新日";

  UserInfo({this.name = "", this.gender = "", this.birthDay = ""});


  AccountInfo? getAccount() {
    if(accountInfo != null) {
      return accountInfo;
    }

    return null;
  }

  setAccount(AccountInfo accountInfo) {
    this.accountInfo = accountInfo;
  }

  Map getMap() {
    return {
      KEY_name: name,
      KEY_gender: gender,
      KEY_birthday: birthDay
    };
  }

  dynamic createUser() {
    Map mapUserInfo = getMap();

    return {
      KEY_name: mapUserInfo[KEY_name],
      KEY_gender: mapUserInfo[KEY_gender],
      KEY_birthday: mapUserInfo[KEY_birthday],
      KEY_createdTime: Timestamp.now(),
      KEY_updatedTime: Timestamp.now()
    };
  }


}