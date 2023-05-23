import 'package:ui_compare/common/common.dart';

class CartState extends ChangeNotifier {
  List<Map<String, dynamic>> list = [];

  void addCart(Map<String, dynamic> product) {
    list.add(product);
    notifyListeners();
  }

  void increement(int index) {
    list[index]['count'] = list[index]['count'] + 1;
    notifyListeners();
  }

  void decreement(int index) {
    if (list[index]['count'] > 1) {
      list[index]['count'] = list[index]['count'] - 1;
      notifyListeners();
    }
  }

  void delete(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
