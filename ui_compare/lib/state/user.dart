import 'package:ui_compare/common/common.dart';

class UserProvider extends ChangeNotifier {
  String? email;
  String? name;

  void setUserData(String userEmail, String userName) {
    email = userEmail;
    name = userName;
    notifyListeners();
  }
}
