


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/model/account_info.dart';
import 'package:training_note/model/user_info.dart';
import 'package:training_note/util/parts.dart';

class Users {
  static const String tableName = "users";
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection(tableName);

  static void createUser(UserInfo userInfo) {
    AccountInfo? accountInfo = userInfo.getAccount();
    String? uid = accountInfo?.getValue(AccountInfo.KEY_uid);


    users.doc(uid).set(userInfo.createUser());

  }

}