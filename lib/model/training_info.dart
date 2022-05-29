// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_array.dart';
import 'package:training_note/model/toraining_details_info.dart';

/// トレーニング管理モデル
class TrainingInfo extends ModelArray {
  Timestamp trainingDate;
  TrainingDetailsInfo? trainingDetailsInfo;

  ///モデル・テーブル名
  static const String tableName = "Training";
  /// テーブルカラム定義
  static const String KEY_trainingDate = "トレーニング日";
  static const String KEY_trainingDetailsInfo = "トレーニング管理詳細モデル";

  /// 初期生成処理
  TrainingInfo({required this.trainingDate}) {
    this.add(this);
  }


  @override
  Map<String, dynamic> getMap() {
    return {
      KEY_trainingDate: trainingDate,
      KEY_trainingDetailsInfo: trainingDetailsInfo
    };
  }

}