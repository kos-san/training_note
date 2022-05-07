/// ユーザ情報の性別を定義するカタログ<br>
/// 改行<br> 
/// カタログ名： 性別カタログ 
class GenderCat {
	/// 変数：man<br>
	/// 和名：男性<br>
	/// コード値：01<br>
	/// ユーザの性別が「男性」に使用されるカタログ値
	/// @return GenderCat
	static GenderCat man = GenderCat("man");
	/// 変数：woman<br>
	/// 和名：女性<br>
	/// コード値：02<br>
	/// ユーザの性別が「女性」に使用されるカタログ値
	/// @return GenderCat
	static GenderCat woman = GenderCat("woman");
	/// 変数：unselected<br>
	/// 和名：未選択<br>
	/// コード値：03<br>
	/// ユーザの性別が未選択だった場合に使用されるカタログ値<br>
	/// 通常は使用されないカタログ値
	/// @return GenderCat
	static GenderCat unselected = GenderCat("unselected");
	/// 変数：none<br>
	/// 和名：なし<br>
	/// コード値：99<br>
	/// なし ※値が正常に取り出せなかった場合に使用される
	/// @return GenderCat
	static GenderCat none = GenderCat("none");

	String? _code;
	String? _string;

	/// キーと和名を紐づけるMap変数
	static final Map<String, String> _stringMap = {
		"man": "男性",
		"woman": "女性",
		"unselected": "未選択",
		"none": "なし"
  };

	/// キーとDB保存用のコード値を紐づけるMap変数
	static final Map<String, String> _codeMap = {
		"man": "01",
		"woman": "02",
		"unselected": "03",
		"none": "99"
	};

	/// カタログの全量を格納するリスト変数
	static final List<GenderCat> _catalogList = [
		man,
		woman,
		unselected,
		none,
  ];

	/// 表示を行うカタログ値のみを格納するリスト変数
	static final List<GenderCat> _displayCatList = [
		man,
		woman,
	];

	GenderCat(String val) {
		_string = _stringMap[val];
		_code = _codeMap[val];
	}

	/// 選択しているカタログ値の保存用のコード値を取得できる
	/// @return String コード値
	String getCode() {
		return _code!;
	}

	/// 選択しているカタログ値の和名を取得できる
	/// @return String カタログ和名
	String getString() {
		return _string!;
	}

	/// 定義したカタログ値の全量のリストを取得できる
	/// @return List<GenderCat> カタログリスト
	static List<GenderCat> getCatalogList() {
		return _catalogList;
	}

	/// 表示専用のカタログリストを取得できる
	/// @return List<GenderCat> 表示用カタログリスト
	static List<GenderCat> getDisplayCatList() {
		return _displayCatList;
	}

	/// 定義済みのカタログ値を和名、またはコード値から取得できる<br>
	/// コード値　→　カタログクラス<br>
	/// 和名　→　カタログクラス<br>
	/// ※入力情報がNULL値、または、カタログ値が算出できなかった場合は「なし（none, 99)」を返却する
	/// @return GenderCat
	static GenderCat convertCat(String? val) {
		if(val != null) {
			for(var catalog in _catalogList) {
				if(val == catalog._string || val == catalog._code) {
					return catalog;
				}
			}
		}

		return GenderCat.none;
	}

}