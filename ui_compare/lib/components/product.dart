import 'package:ui_compare/common/common.dart';
import 'package:intl/intl.dart';

class Product extends StatefulWidget {
  Product({
    super.key,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // int count = 1;
  @override
  Widget build(BuildContext context) {
    var products = ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    Map<String, dynamic> map = products![0];
    return Scaffold(
        body: Consumer<CartState>(builder: (context, cartState, child) {
      return Container(
        color: products[1],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, bottom: 20, top: 55),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, null);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextDesign(
                text: map['name'],
                size: 40,
                bold: "y",
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextDesign(
                        text: "Price",
                        size: 20,
                        color: Colors.white,
                      ),
                      TextDesign(
                        text: "Rs ${map['price']}",
                        size: 40,
                        color: Colors.white,
                        bold: "y",
                      )
                    ],
                  ),
                  const Spacer(),
                  Flexible(
                    child: Image.network(
                      map['image'],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: TextDesign(
                          text: map['description'],
                          size: 18,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 32, left: 32, right: 32, bottom: 10),
                        child: TextDesign(text: "Category", size: 28),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 32, right: 32, bottom: 10),
                          child: TextDesign(
                            text: products[0]['category'],
                            size: 20,
                            color: Colors.grey,
                          )),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 32, left: 32, right: 32, bottom: 10),
                        child: TextDesign(text: "Estimated Time", size: 28),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 32, right: 32, bottom: 10),
                          child: TextDesign(
                            text: DateFormat('dd-MM-yyyy').format(
                                DateTime.now().add(const Duration(days: 5))),
                            size: 20,
                            color: Colors.grey,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              cartState.addCart(map);
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: "Added",
                                  autoCloseDuration: Duration(seconds: 5));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                backgroundColor: products[1]),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: TextDesign(
                                text: "Cart",
                                size: 25,
                                bold: "y",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
