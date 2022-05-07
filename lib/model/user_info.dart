// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/catalog/gender_cat.dart';
import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/model.dart';
/// ユーザ情報を保持するモデル
class UserInfo extends Model{
  late String name;
  late GenderCat gender;
  late String birthDay;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  AccountInfo? accountInfo;

  ///DB：テーブルカラム
  static const String KEY_name = "名前";
  static const String KEY_gender = "性別";
  static const String KEY_birthday = "生年月日";
  static const String KEY_createdTime = "作成日";
  static const String KEY_updatedTime = "更新日";

  UserInfo({required this.name, required this.gender, required this.birthDay, required this.accountInfo}) {
    createdTime = Timestamp.now();
    updatedTime = Timestamp.now();
  }


  AccountInfo? getAccount() {
    if(accountInfo != null) {
      return accountInfo;
    }

    return null;
  }

  setAccount(AccountInfo accountInfo) {
    this.accountInfo = accountInfo;
  }

  @override
  Map<String, dynamic> getMap() {
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
      KEY_gender: mapUserInfo[KEY_gender].getCode(),
      KEY_birthday: mapUserInfo[KEY_birthday],
      KEY_createdTime: Timestamp.now(),
      KEY_updatedTime: Timestamp.now()
    };
  }

  void create() {
    Users.create(this);
  }


}