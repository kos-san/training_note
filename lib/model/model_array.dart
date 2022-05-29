import 'package:training_note/model/model.dart';


abstract class ModelArray extends Model {
  List<Model> listModel = [];
  void add(Model model) {
    listModel.add(model);
  }

  void remove() {

  }
}
