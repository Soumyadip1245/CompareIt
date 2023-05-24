import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_compare/common/common.dart';

class CartState extends ChangeNotifier {
  List<Map<String, dynamic>> list = [];
  void payment(String email) {
    storeOrders(email);
  }

  void addCart(Map<String, dynamic> product) {
    if (!list.contains(product)) {
      list.add(product);
    }
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

  Future<void> storeOrders(String email) async {
    final CollectionReference compare =
        FirebaseFirestore.instance.collection('users');

    final QuerySnapshot querySnapshot =
        await compare.where('email', isEqualTo: email).get();

    if (querySnapshot.size > 0) {
      final DocumentSnapshot userDoc = querySnapshot.docs.first;
      final data = userDoc.data() as Map<String, dynamic>;
      final orders = data['orders'] as List<dynamic>;

      for (final map in list) {
        orders.add(map);
      }

      await compare.doc(userDoc.id).update({'orders': orders});
      list.clear();
      notifyListeners();
    }
  }
}
