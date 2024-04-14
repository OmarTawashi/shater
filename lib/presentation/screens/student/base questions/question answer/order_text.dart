import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class OrderText extends StatelessWidget {
  const OrderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSize16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 107,
            width: Get.width,
            decoration: BoxDecoration(
                color: COLORS.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10 + 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize16,
                      vertical: Dimensions.paddingSize25 + 4),
                  separatorBuilder: (context, index) => SizedBox(
                    width: Dimensions.paddingSize20,
                  ),
                  itemBuilder: (context, index) {
                    final l = ['الاول', 'الثاني', "الثالث", "الرابع"];
                    return Container(
                      width: 70,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSize10, vertical: 14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: CustomText(
                        text: l[index],
                        fontSize: Dimensions.fontSize15,
                        color: COLORS.primaryColor,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 107,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize16,
                      vertical: Dimensions.paddingSize25 + 4),
                  separatorBuilder: (context, index) => SizedBox(
                    width: Dimensions.paddingSize20,
                  ),
                  itemBuilder: (context, index) {
                    final l = ['الاول', 'الثاني', "الثالث"];
                    return index >= l.length
                        ? Container(
                            width: 70,
                            height: 60,
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize10,
                                vertical: 14),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(228, 228, 228, 1),
                                borderRadius: BorderRadius.circular(13)),
                          )
                        : Container(
                            width: 70,
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize5,
                                vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: COLORS.primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(13)),
                            child: CustomText(
                              text: l[index],
                              fontSize: Dimensions.fontSize15,
                              color: COLORS.primaryColor,
                              textAlign: TextAlign.center,
                            ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ReorderableListExample extends StatefulWidget {
//   @override
//   _ReorderableListExampleState createState() => _ReorderableListExampleState();
// }

// class _ReorderableListExampleState extends State<ReorderableListExample> {
//   List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

//   @override
//   Widget build(BuildContext context) {
//     return  ReorderableColumn(
//         children: items.map((item) {
//           return ListTile(
//             key: Key(item),
//             title: Text(item),
//             leading: Icon(Icons.drag_handle),
//           );
//         }).toList(),
//         onReorder: (oldIndex, newIndex) {
//           setState(() {
//             if (oldIndex < newIndex) {
//               newIndex -= 1;
//             }
//             final String item = items.removeAt(oldIndex);
//             items.insert(newIndex, item);
//           });
//         },
  
//     );
//   }
// }