import 'package:ui_compare/common/common.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextDesign(
            text: "Payment Method",
            size: 40,
            bold: "y",
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assests/images/tick.gif"),
                  TextDesign(
                    text: "Payment Approved",
                    size: 28,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
