import 'package:flutter/material.dart';

class CustomTextFieldText extends StatelessWidget {
  const CustomTextFieldText({Key? key, required this.txt}) : super(key: key);
  final TextEditingController txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey.shade300,
                blurRadius: 6)
          ]),
      child: TextField(
        controller: txt,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontSize: 22),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your value",
            hintStyle:
            TextStyle(color: Colors.grey.shade200, fontSize: 16)),
      ),
    );
  }
}
