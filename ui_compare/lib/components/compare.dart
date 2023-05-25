import 'package:ui_compare/common/common.dart';

class Compare extends StatefulWidget {
  const Compare({Key? key}) : super(key: key);

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  var search = TextEditingController();

  void searchData() {
    Provider.of<CompareState>(context, listen: false).getEcommerce(search.text);
    search.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Consumer<CompareState>(
          builder: (context, data, index) {
            var productList = data.items;
            return Column(
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
                      ),
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
                  controller: search,
                  onSubmit: () {
                    searchData();
                  },
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "Ecommerce"),
                      Tab(text: "Grocery"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    children: [
                      if (productList.isEmpty)
                        Center(
                          child: Image.asset("assests/images/search.png"),
                        )
                      else
                        Online(),
                      OnlineShop(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
