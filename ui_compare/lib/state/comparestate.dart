import 'package:ui_compare/common/common.dart';
import 'package:http/http.dart' as http;

class CompareState extends ChangeNotifier {
  List<dynamic> items = [];
  void getEcommerce(String search) async {
    var url = "https://new-upload.vercel.app/flutter/ecommerce";
    var jsondata = {"searchQuery": search};
    var encodeBody = json.encode(jsondata);
    var urlparse = Uri.parse(url);
    var response = await http.post(
      urlparse,
      body: encodeBody,
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(response.body);
    if (data['products'] == null) {
      var url = "https://compareit-wgnt.onrender.com/flutter/ecommerce";
      var jsondata = {"searchQuery": search};
      var encodeBody = json.encode(jsondata);
      var urlparse = Uri.parse(url);
      var response = await http.post(
        urlparse,
        body: encodeBody,
        headers: {"Content-Type": "application/json"},
      );
      var data = jsonDecode(response.body);
      items = data['products'];
    } else {
      items = data['products'];
    }

    notifyListeners();
  }
}
