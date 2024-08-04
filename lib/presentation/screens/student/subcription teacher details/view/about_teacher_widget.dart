// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shater/util/color.dart';

// class AboutTeacherWidget extends StatelessWidget {
//   const AboutTeacherWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           about_box(
//             mainTitle: "ميزات الاشتراك",
//             child: ListView.separated(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) => Row(
//                 children: [
//                   SvgPicture.asset("assets/icons/check_icon.svg"),
//                   SizedBox(
//                     width: 8.w,
//                   ),
//                   Text(
//                     "شهادة من كلية التربية جامعة الكويت",
//                     style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   )
//                 ],
//               ),
//               separatorBuilder: (context, index) => SizedBox(
//                 height: 10.h,
//               ),
//               itemCount: 4,
//             ),
//           ),
// // expirianse box
//           about_box(
//             mainTitle: "الخبرة",
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: COLORS.secanderyColor,
//                   radius: 18.r,
//                   child: Text("3"),
//                 ),
//                 SizedBox(
//                   width: 8.w,
//                 ),
//                 Text(
//                   "سنوات من الخبرة",
//                   style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
      
//           about_box(
//             mainTitle: "نبذة",
//             child: Text(
//               "استطيع تدريس النهج لاولادكم بشكل احترافي  استطيع تدريس النهج لاولادكم بشكل احترافي",
//               style: TextStyle(fontSize: 16.sp, color: Colors.white),
//             ),
//           ),
//           about_box(
//             mainTitle: "",
//             child: Row(
//               children: [
//                 Text(
//                   "فيديو تعريفي عن المعلم ",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                 Spacer(),
//                 Icon(
//                   Icons.play_circle,
//                   color: Colors.white,
//                   size: 35,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container about_box({required String mainTitle, required Widget child}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 15.h),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: COLORS.backGroundColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             mainTitle,
//             style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           child
//         ],
//       ),
//     );
//   }

// }
