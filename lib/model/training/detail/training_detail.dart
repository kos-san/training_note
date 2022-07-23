import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/util/keys.dart';

class TrainingDetail extends Model {
  @override
  String? id; // トレーニング詳細ID
  String? trainingType; // トレーニング種別
  String? trainingSite; // トレーニング部位
  String? trainingId;  // トレーニングID

  Timestamp? createdTime;
  Timestamp? updatedTime;

  TrainingDetail();

  @override
  Map<Keys, dynamic> getMap() {
    return {
      Keys.deleteFlg: deleteFlg,
      Keys.id: id,
      Keys.trainingId: trainingId,
      Keys.trainingType: trainingType,
      Keys.trainingSite: trainingSite,
      Keys.createdTime: createdTime,
      Keys.updatedTime: updatedTime
    };
  }

  @override
  void setValue({required Keys key, required val}) {
    // TODO: implement setValue
  }

}