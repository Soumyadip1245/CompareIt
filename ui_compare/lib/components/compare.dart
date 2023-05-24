import 'package:ui_compare/common/common.dart';

class Compare extends StatefulWidget {
  const Compare({super.key});

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/landing');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  const Spacer(),
                  Badge(
                    child: InkWell(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const TextDesign(text: "Compare", size: 40, bold: "y"),
            const SizedBox(
              height: 10,
            ),
            TextInput(
              text: "Search Products",
              icon: Icons.search,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: "Ecommerce"),
                  Tab(text: "Grocery"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: TabBarView(
                children: [
                  Online(),
                  SingleChildScrollView(child: OnlineShop()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
