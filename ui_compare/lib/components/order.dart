import 'package:ui_compare/common/common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserDetails>(
        builder: (context, data, child) {
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('email', isEqualTo: data.email)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                final List<dynamic>? orders =
                    streamSnapshot.data!.docs.isNotEmpty
                        ? streamSnapshot.data!.docs.first['orders']
                        : null;
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 55, left: 32, right: 32, bottom: 32),
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
                        )),
                    TextDesign(
                      text: "Order History",
                      size: 40,
                      bold: "y",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    streamSnapshot.data!.docs.first['orders'].length == 0
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Center(
                                  child:
                                      Image.asset("assests/images/order.png")),
                            ],
                          )
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ListView.builder(
                                  itemCount: streamSnapshot
                                      .data!.docs.first['orders'].length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xFFF5F6F9),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 100,
                                            padding: EdgeInsets.all(5),
                                            child: Image.network(
                                                orders![index]['image']),
                                          ),
                                          title: TextDesign(
                                            text: "${orders[index]['name']}",
                                            size: 20,
                                            color: Colors.black,
                                            bold: "y",
                                          ),
                                          subtitle: TextDesign(
                                            text:
                                                "Rs. ${orders[index]['price']} x ${orders[index]['count']}",
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                          trailing: TextDesign(
                                              text:
                                                  "ID: ${orders[index]['id']}",
                                              size: 18),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                  ],
                );
              } else {
                return Center(child: Image.asset("assests/images/order.png"));
              }
            },
          );
        },
      ),
    );
  }
}
