
enum enmKeyCategory{
  mainModel,
  subModel,
  viewModel,
  modelKeys,
  other
}

class Keys {

  late String _keyName;
  late enmKeyCategory _keyCategory;

  /// モデルキー
  static final Keys account = Keys(keyName: "account", keyCategory: enmKeyCategory.mainModel);
  static final Keys user = Keys(keyName: "user", keyCategory: enmKeyCategory.mainModel);
  static final Keys training = Keys(keyName: "training", keyCategory: enmKeyCategory.mainModel);

  /// 内部モデルキー
  static final Keys trainingDetails = Keys(keyName: "trainingDetailsInfo", keyCategory: enmKeyCategory.subModel);

  /// モデル項目キー
  static final Keys createdTime = Keys(keyName: "作成日", keyCategory: enmKeyCategory.modelKeys);
  static final Keys updatedTime = Keys(keyName: "更新日", keyCategory: enmKeyCategory.modelKeys);
  static final Keys id = Keys(keyName: "id", keyCategory: enmKeyCategory.modelKeys);
  static final Keys name = Keys(keyName: "名前", keyCategory: enmKeyCategory.modelKeys);
  static final Keys gender = Keys(keyName: "性別", keyCategory: enmKeyCategory.modelKeys);
  static final Keys birthDay = Keys(keyName: "生年月日", keyCategory: enmKeyCategory.modelKeys);
  static final Keys trainingDate = Keys(keyName: "トレーニング日", keyCategory: enmKeyCategory.modelKeys);
  static final Keys accountId = Keys(keyName: "アカウントID", keyCategory: enmKeyCategory.modelKeys);
  static final Keys trainingType = Keys(keyName: "トレーニング種別", keyCategory: enmKeyCategory.modelKeys);
  static final Keys trainingSite = Keys(keyName: "トレーニング部位", keyCategory: enmKeyCategory.modelKeys);
  static final Keys trainingId = Keys(keyName: "トレーニングID", keyCategory: enmKeyCategory.modelKeys);
  static final Keys email = Keys(keyName: "メールアドレス", keyCategory: enmKeyCategory.modelKeys);
  static final Keys password = Keys(keyName: "パスワード", keyCategory: enmKeyCategory.modelKeys);
  static final Keys passwordConfirm = Keys(keyName: "確認用パスワード", keyCategory: enmKeyCategory.modelKeys);
  static final Keys uid = Keys(keyName: "uid", keyCategory: enmKeyCategory.modelKeys);


  /// その他キー
  static final Keys deleteFlg = Keys(keyName: "削除フラグ", keyCategory: enmKeyCategory.other);
  static final Keys updateFlg = Keys(keyName: "更新フラグ", keyCategory: enmKeyCategory.other);

  Keys({required String keyName, enmKeyCategory keyCategory = enmKeyCategory.other}) {
    _keyName = keyName;
    _keyCategory = keyCategory;
  }

  /// ※DB保存時は、モデル名、モデル項目名ともにこの変数の文字列を使用して保存する
  String getKeyName() {
    return _keyName;
  }

  bool isMainModel() {
    return enmKeyCategory.mainModel == _keyCategory;
  }
  bool isSubModel() {
    return enmKeyCategory.subModel == _keyCategory;
  }
  bool isModelKey() {
    return enmKeyCategory.modelKeys == _keyCategory;
  }

}
