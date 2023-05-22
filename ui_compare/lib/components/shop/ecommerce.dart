import '../../common/common.dart';

class Ecommerce extends StatefulWidget {
  const Ecommerce({
    super.key,
  });

  @override
  State<Ecommerce> createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  List<dynamic> color = [
    const Color(0xFFFFFB7882),
    const Color(0xFFFF3d82AE),
    const Color(0xFFFFD48984),
    const Color(0xFFFFE6B398),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable GridView's scroll
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        var color1 = color[index % color.length];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 212,
              width: 200,
              decoration: BoxDecoration(
                color: color1.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assests/images/headphone.png"),
            ),
            const SizedBox(height: 10),
            const TextDesign(
              text: "Bose Headphones",
              size: 15,
              color: Colors.grey,
            ),
            const TextDesign(
              text: "Rs. 2500",
              size: 15,
              color: Colors.black,
            ),
          ],
        );
      },
    );
  }
}
