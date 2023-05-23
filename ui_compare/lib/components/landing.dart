import 'package:ui_compare/common/boxcard.dart';
import 'package:ui_compare/common/common.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<dynamic> map = const [
    Color(0xFFFF6474),
    Color(0xFFFFAA5B),
    Color(0xFF9AA0FC),
    Color(0xFFFBAEAE),
    Color(0xFF71CFB9)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, data, child) {
        return Container(
          color: const Color(0xFF5d69b3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
                child: Row(
                  children: [
                    const Icon(
                      Icons.sort,
                      size: 35,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Badge(
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, left: 32, right: 32),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextDesign(
                    text: "Welcome, ${data.name}",
                    size: 40,
                    color: Colors.white,
                    bold: "y",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextInput(
                          text: "Search Category",
                          icon: Icons.search,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/compare');
                              },
                              child: BoxCard(
                                  bgcolor: map[0],
                                  bgtext: "Compare",
                                  image: "assests/images/compare.png"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/shop');
                              },
                              child: BoxCard(
                                  bgcolor: map[1],
                                  bgtext: "Shop",
                                  image: "assests/images/shopping-online.png"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/order');
                              },
                              child: BoxCard(
                                  bgcolor: map[3],
                                  bgtext: "Orders",
                                  image: "assests/images/order-now.png"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: BoxCard(
                                  bgcolor: map[4],
                                  bgtext: "Payment",
                                  image: "assests/images/cashless-payment.png"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
