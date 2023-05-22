import '../../common/common.dart';

class Clothing extends StatefulWidget {
  const Clothing({super.key});

  @override
  State<Clothing> createState() => _ClothingState();
}

class _ClothingState extends State<Clothing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Hi"));
  }
}
