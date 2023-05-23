import 'package:ui_compare/common/common.dart';

class CartState extends ChangeNotifier {
  List<Map<String, dynamic>> list = [];

  void addCart(var ob) {
    if (list.contains(ob)) {
      ob['count'] = getCount(ob['id']);
    } else {
      list.add(ob);
    }
    notifyListeners();
  }

  void deleteCart(int i) {
    list.removeAt(i);
    notifyListeners();
  }

  Map<String, int> productCounts = {};

  void setCount(String productId, int count) {
    productCounts[productId] = count;
    notifyListeners();
  }

  int getCount(String productId) {
    return productCounts[productId] ?? 1;
  }

  void increment(String productId) {
    int count = getCount(productId) + 1;
    setCount(productId, count);
  }

  void decrement(String productId) {
    int count = getCount(productId);
    if (count > 1) {
      count--;
      setCount(productId, count);
    }
  }
}
