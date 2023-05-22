import 'common.dart';

class BoxCard extends StatelessWidget {
  final Color bgcolor;
  final String bgtext;
  final String image;
  const BoxCard(
      {required this.bgcolor, required this.bgtext, required this.image})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 192,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgcolor.withOpacity(0.5),
      ),
      child: Column(
        children: [
          TextDesign(
            text: bgtext,
            size: 20,
            bold: "y",
            color: Colors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            image,
          )
        ],
      ),
    );
  }
}
