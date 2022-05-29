import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_note/catalog/gender_cat.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/user_info.dart';
import 'package:training_note/util/parts.dart';

class Users {
  static const String tableName = "users";
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection(tableName);



  static void create(UserInfo userInfo) {
    AccountInfo? accountInfo = userInfo.getAccount();
    String? uid = accountInfo?.getValue(key: AccountInfo.KEY_uid);

    users.doc(uid).set(userInfo.createUser());

  }

  static Future<Map<String, dynamic>> read(AccountInfo accountInfo) async{
    bool result = false;
    Map<String, dynamic> mapResult = {
      "result": result
    };

    String uid = accountInfo.getValue(key: AccountInfo.KEY_uid);
    try {
      var _result = await users.doc(uid).get();
      String _name = _result[UserInfo.KEY_name];
      String _genderCode = _result[UserInfo.KEY_gender];
      String _birthDay = _result[UserInfo.KEY_birthday];
      Timestamp createdTime = _result[UserInfo.KEY_createdTime];
      Timestamp updatedTime = _result[UserInfo.KEY_updatedTime];

      UserInfo userInfo = UserInfo(name: _name, gender: GenderCat.convertCat(_genderCode), birthDay: _birthDay, accountInfo: accountInfo, createdTime: createdTime, updatedTime: updatedTime);

      mapResult["userInfo"] = userInfo;
      result = true;
    } catch(e) {
      print(e);
    }

    return mapResult;
  }

}