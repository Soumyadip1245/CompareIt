import 'package:ui_compare/common/common.dart';

class Product extends StatefulWidget {
  Product({
    super.key,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    var products = ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    print(products);
    Map<String, dynamic> map = products![0];
    CartState countState = Provider.of<CartState>(context);
    String productId = map['id'];

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
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      size: 28,
                      color: Colors.white,
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
                      TextDesign(
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: TextDesign(
                        text: map['description'],
                        size: 18,
                        height: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                countState.increment(productId);
                                map['count'] = countState.getCount(productId);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextDesign(
                            text: "${countState.getCount(productId)}",
                            size: 25,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                countState.decrement(productId);
                                map['count'] = countState.getCount(productId);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            cartState.addCart(map);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              products[1],
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: TextDesign(
                            text: "Cart",
                            size: 25,
                            bold: "y",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
