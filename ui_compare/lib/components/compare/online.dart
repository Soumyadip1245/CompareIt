import 'package:ui_compare/common/common.dart';

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CompareState>(builder: (context, data, index) {
      return ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            String sentence = data.items[index]['title'];
            List<String> firstTwoWords = sentence.split(" ").sublist(0, 2);
            String result = firstTwoWords.join(" ");
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            // color: const Color(0xFFFFeceff2),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.network(data.items[index]['image']),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: TextDesign(
                              text: result,
                              size: 20,
                              bold: "y",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextDesign(
                            text: " Rs. ${data.items[index]['price']}",
                            size: 18,
                            color: Colors.grey,
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFd1ecf1),
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 40,
                            child: Center(
                                child: TextDesign(
                              text: data.items[index]['from'],
                              size: 15,
                              bold: "y",
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }));
  }
}
