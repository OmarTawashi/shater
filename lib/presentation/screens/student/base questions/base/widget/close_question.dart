import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseQuestion extends StatelessWidget {
  const CloseQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
       Get.back(); 
      } ,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,color: Colors.black
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Icon(Icons.close_sharp,color: Colors.white,weight: 10)),
      ),
    );
  }
}