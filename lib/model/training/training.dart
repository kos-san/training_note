// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiver/strings.dart';
import 'package:training_note/firebase/firestore/training_dao.dart';
import 'package:training_note/model/account.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_array.dart';
import 'package:training_note/model/training/detail/toraining_details.dart';

import '../../util/keys.dart';

class Training extends Model{
  String id;
  String accountId;
  String trainingDate;
  Timestamp? createdTime;
  Timestamp? updatedTime;
  ModelArray trainingDetails = TrainingDetails();

  Training({this.id = "", this.accountId = "", required this.trainingDate, this.createdTime, this.updatedTime}) {
    //アカウントID（uid）がなかった場合は、アカウントモデルから参照する
    if(isBlank(accountId) && getModel(key: Keys.account) != null) {
      Model account = getModel(key: Keys.account)!;
      String uid = account.getValue(key: Keys.uid);
      accountId = uid;
    }
    createFlg = true;
  }

  void commit() {
    //TODO:モデル項目チェックを実施する
    if(createFlg) {

    }
  }

  @override
  Map<Keys, dynamic> getMap() {
    return {
      Keys.deleteFlg: deleteFlg, //削除フラグ
      Keys.id: id, // モデルID
      Keys.accountId: accountId, // アカウントID
      Keys.trainingDate: trainingDate, // トレーニング日
      Keys.createdTime: createdTime, // 作成日
      Keys.updatedTime: updatedTime, // 更新日
      Keys.trainingDetails: trainingDetails // トレーニング詳細モデル
    };
  }

  @override
  void setValue({required Keys key, required val}) {
    // TODO: implement setValue
  }

}