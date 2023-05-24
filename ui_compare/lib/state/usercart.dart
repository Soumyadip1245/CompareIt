import 'package:ui_compare/common/common.dart';

class UserDetails extends ChangeNotifier {
  String? email;
  List<dynamic>? orders;

  void setUserData(String email, List<dynamic> orders) {
    this.email = email;
    this.orders = orders;
    notifyListeners();
  }
}
