import 'package:flutter/material.dart';

class CustomToastWidget extends StatelessWidget {
  final String message;

  const CustomToastWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(247, 185, 185, 1)),
        color: const Color.fromRGBO(250, 229, 228, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo_app.png', // Replace with your logo asset path
            width: 35,
            height: 35,
            color: const Color.fromRGBO(190, 74, 69, 1),
          ),
          SizedBox(width: 16),
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: const Color.fromRGBO(190, 74, 69, 1),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}