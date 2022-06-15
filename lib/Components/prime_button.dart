import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class PrimeButton extends StatelessWidget {
  const PrimeButton({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: AppColors.primeColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey.shade200,
                blurRadius: 6)
          ]),
      child: Center(
          child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),
      )),
    );
  }
}
