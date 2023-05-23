import 'package:ui_compare/common/common.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CartState>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.all(40),
        child: Text("${data.list}"),
      );
    }));
  }
}
