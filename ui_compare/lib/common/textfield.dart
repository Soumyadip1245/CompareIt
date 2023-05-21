import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final IconData? icon;
  final String text;
  final TextEditingController? controller;
  const TextInput({required this.text, this.icon, this.controller});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFECECEC),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                    prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
                    hintText: widget.text,
                    hintStyle: const TextStyle(fontSize: 20),
                    border: InputBorder.none),
              ))),
    );
  }
}
