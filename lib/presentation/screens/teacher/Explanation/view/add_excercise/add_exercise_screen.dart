import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/flavors/environment.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/custom_add_quastion_screen.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/true_false_quastion.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CardModel> cards = [
      CardModel(
        imageUrl: IMAGES.comprehensivetraining,
        title: "الشامل",
        subtitle:
            'انشاء معادلات حسابية ، أو كتابات نصية ، أو كليهما ، أو وضع تخطي إذا كانت الصفحة ليس فيها تدريبات',
        routeName: "routeName",
        exerciseType: ExerciseType.ALSHAMEL,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.multiple_choice_training,
        title: "اختيار من متعدد",
        subtitle: "انشاء اختيارات متعددة من صور ونصوص",
        routeName: "routeName",
        exerciseType: ExerciseType.MULTIPLECHOISE,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.ranking_training,
        title: "الترتيب",
        subtitle: "ترتيب الصور أو النصوص",
        routeName: "routeName",
        exerciseType: ExerciseType.ORDARING,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.basic_answer_excercise,
        title: "اجابة اساسية",
        subtitle: "يمكن انشاء اكثر من اجابة مرتبطة بالاجابة الأساسية",
        routeName: "routeName",
        exerciseType: ExerciseType.BASICQUASTION,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.true_or_false_training,
        title: "صح و خطأ",
        subtitle: "انشاء خيارين فقط للاجابة ",
        routeName: "routeName",
        exerciseType: ExerciseType.TRUEORFALSE,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.matching_training,
        title: "التوصيل",
        subtitle: "انشاء صور أو نصوص وانشاء روابط صحيحة بينها ",
        routeName: "routeName",
        exerciseType: ExerciseType.DELEVARING,
        quastionUi: TrueOrFalseQuastion(),
      ),
      CardModel(
        imageUrl: IMAGES.writting_training,
        title: "التدريب الكتابي",
        subtitle: "انشاء أحرف و كلمات للتدرب عليها من قبل الطالب",
        routeName: "routeName",
        exerciseType: ExerciseType.WRITING,
        quastionUi: TrueOrFalseQuastion(),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 60.w,
        toolbarHeight: 110.h,
        backgroundColor: COLORS.secanderyColor,
        automaticallyImplyLeading: false,
        excludeHeaderSemantics: true,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: COLORS.primaryColor,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "types_of_exercise_questions".tr,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: COLORS.primaryColor,
                child: const Icon(
                  Icons.insert_drive_file_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: const Icon(
          //       Icons.more_vert,
          //       size: 30,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
                color: Colors.white,
                elevation: 0.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        cards[index].imageUrl,
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cards[index].title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              cards[index].subtitle,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                      child: GestureDetector(
                        onTap: () => Get.to(
                          () => CustomAddQuastionScreen(
                            appBarTitle: cards[index].title,
                            exerciseType: cards[index].exerciseType,
                            selectedQuastionWidget: cards[index].quastionUi,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                color: COLORS.dividerColor,
                indent: 10,
              ),
          itemCount: cards.length),
    );
  }
}

class CardModel {
  final String title;
  final String subtitle;
  final String routeName;
  final String imageUrl;
  final ExerciseType exerciseType;
  final Widget quastionUi;

  CardModel(
      {required this.exerciseType,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.routeName,
      required this.quastionUi});
}
