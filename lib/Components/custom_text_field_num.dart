import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldNumber extends StatelessWidget {
  const CustomTextFieldNumber({Key? key, required this.number}) : super(key: key);
  final TextEditingController number;

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
        controller: number,
        keyboardType:
        const TextInputType.numberWithOptions(decimal: true),
        textInputAction: TextInputAction.next,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(
              r'^[0-9]*[]?[0-9]*',
            ),
          ),
        ],
        style: const TextStyle(fontSize: 22),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter only numbers",
            hintStyle:
            TextStyle(color: Colors.grey.shade200, fontSize: 16)),
      ),
    );
  }
}
