import 'dart:convert';

import 'package:ui_compare/common/common.dart';
import 'package:http/http.dart' as http;

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFeceff2),
                      ),
                      child: Image.asset("assests/images/headphone.png"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextDesign(
                            text: "Iphone 14 Pro Max",
                            size: 20,
                            bold: "y",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextDesign(
                          text: "Rs. 1200000",
                          size: 18,
                          color: Colors.grey,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFd1ecf1),
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 40,
                          child: Center(
                              child: TextDesign(
                            text: "Amazon",
                            size: 15,
                            bold: "y",
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
