import 'package:ui_compare/common/common.dart';

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hello"),
    );
  }
}
