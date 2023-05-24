import 'package:ui_compare/common/common.dart';
import '../common/shopcards.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String? search;
  void searchProduct(String query) {
    setState(() {
      search = query;
    });
  }

  List<dynamic> color = [
    const Color(0xFFFFFB7882),
    const Color(0xFFFF3d82AE),
    const Color(0xFFFFD48984),
    const Color(0xFFFFE6B398),
  ];
  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 32, top: 45, right: 32, bottom: 32),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/landing');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
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
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
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
                  controller: searchcontroller,
                  onChanged: searchProduct),
              const SizedBox(height: 10),
              const TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: "Ecommerce"),
                  Tab(text: "Grocery"),
                  Tab(text: "Clothing"),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                        child: Ecommerce(
                            search: search, onSearchChanged: searchProduct)),
                    SingleChildScrollView(
                        child: Grocery(
                            search: search, onSearchChanged: searchProduct)),
                    SingleChildScrollView(
                        child: Clothing(
                            search: search, onSearchChanged: searchProduct)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
