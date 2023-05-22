import 'package:ui_compare/common/common.dart';

import '../common/shopcards.dart';

class Shop extends StatefulWidget {
  const Shop({
    super.key,
  });

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<dynamic> color = [
    const Color(0xFFFFFB7882),
    const Color(0xFFFF3d82AE),
    const Color(0xFFFFD48984),
    const Color(0xFFFFE6B398),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 32, top: 45, right: 32),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
                Spacer(),
                Badge(
                  // badgeColor: Colors.red,
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            const TextDesign(
              text: "Shop Wishlist",
              size: 28,
              bold: "y",
            ),
            TextInput(
              text: "Search Products",
              icon: Icons.search,
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(child: ShopCard()),
              ),
            ),
            BottomNavigation()
          ],
        ),
      ),
    );
  }
}
