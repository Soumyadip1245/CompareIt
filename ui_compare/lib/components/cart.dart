import 'package:ui_compare/common/common.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<CartState, UserProvider>(
        builder: (context, data, data1, child) {
      double total = 0;
      for (var i in data.list) {
        total = total + i['price'] * i['count'];
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 55, left: 32, right: 32, bottom: 32),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
            child: TextDesign(text: "Shopping Cart", size: 40, bold: "y"),
          ),
          Expanded(
            child: data.list.isEmpty
                ? Image.asset("assests/images/cart.png")
                : Container(
                    child: ListView.builder(
                        itemCount: data.list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFFFecf0f3)
                                                  .withOpacity(0.7),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(28),
                                            child: Image.network(
                                              data.list[index]['image'],
                                              height: 70,
                                              width: 100,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextDesign(
                                                text:
                                                    "${data.list[index]['name']}",
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextDesign(
                                                text:
                                                    "Rs. ${data.list[index]['price'] * data.list[index]['count']}",
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          data.increement(
                                                              index);
                                                        },
                                                        icon: const Icon(
                                                            Icons.add)),
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5,
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.grey),
                                                        child: TextDesign(
                                                          text:
                                                              '${data.list[index]['count']}',
                                                          size: 20,
                                                          color: Colors.white,
                                                        )),
                                                    IconButton(
                                                        onPressed: () {
                                                          data.decreement(
                                                              index);
                                                        },
                                                        icon: const Icon(
                                                            Icons.remove)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        data.delete(index);
                                      },
                                      child: const TextDesign(
                                          text: "Delete", size: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.black),
                  onPressed: () {
                    data.payment(data1.email!);
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: "Ordered Placed",
                        autoCloseDuration: Duration(seconds: 2));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextDesign(
                      text: "Rs. ${total}",
                      size: 28,
                      bold: "y",
                    ),
                  )),
            ),
          ))
        ],
      );
    }));
  }
}
