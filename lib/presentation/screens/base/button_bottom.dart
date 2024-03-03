import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';

class ButtonBottom extends StatelessWidget {
  final Function()? onTap;
  const ButtonBottom({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: CustomText(
                        text: 'next',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ]);
  }
}