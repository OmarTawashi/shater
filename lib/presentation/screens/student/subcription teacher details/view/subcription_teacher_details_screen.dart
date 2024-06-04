import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_sliver_app_bar.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/widgets/item_exercise_subject.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/controller/subcription_teacher_details_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class SubcriptionTeacherDetailsScreen extends StatelessWidget {
  const SubcriptionTeacherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 86, 153, 1),
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        toolbarHeight: 55,
      ),
      body: GetBuilder<SubcriptionTeacherDetailsController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SectionHeaderDelegate(
                  height: 180,
                  widget: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(8, 202, 254, 1.0),
                                  Color.fromRGBO(229, 89, 241, 1.0),
                                ],
                                stops: [0.0, 1.0],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 90.0,
                                      height: 90.0,
                                      child: CachedNetworkImageWidget(
                                        imageUrl: controller.teacherController
                                                ?.teacherSelected?.image ??
                                            '',
                                        fit: BoxFit
                                            .cover, // Fill the container completely
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSize12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: CustomSvgPicture(
                                assetName: ICONS.starRatingFull),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSize8,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: COLORS.secanderyColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CustomText(
                              text: controller.teacherController
                                      ?.teacherSelected?.teacherRate
                                      .toString() ??
                                  '',
                              color: Colors.white,
                              fontSize: Dimensions.fontSize16,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.getTeacherDetailsScreen());
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize16),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize16,
                                    vertical: Dimensions.paddingSize12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(8, 202, 254, 1.0),
                                      Color.fromRGBO(229, 89, 241, 1.0),
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                ),
                                child: CustomText(
                                  text: controller.teacherController
                                          ?.teacherSelected?.name ??
                                      '',
                                  color: Colors.white,
                                  fontSize: Dimensions.fontSize18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: Dimensions.paddingSize16,
              ),
            ),
            AnimatorContainer(
              viewType: controller.viewType,
              isSliver: true,
              errorWidget: CustomEmptyView(
                assetName: ICONS.teacherWhite,
                primaryText: 'soon',
                secanderyText: 'find_account_teacher',
              ),
              emptyParams: EmptyParams(
                  text: 'soon'.tr,
                  caption: 'find_account_teacher'.tr,
                  image: ICONS.decriptionTop),
              successWidget: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: Dimensions.paddingSize16,
                  mainAxisExtent: 150,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ItemExerciseSubject(
                      index: index,
                      onTap: () {
                        controller
                            .setSubjectVideo(controller.subjectVideos[index]);
                        Get.toNamed(Routes.getBaseQuestionScreen());
                      },
                      subjectVideo: controller.subjectVideos[index],
                    );
                  },
                  childCount: controller.subjectVideos.length,
                ),
              ),
              retry: () {
                controller.fetchVideoOfSubject();
              },
            ),
          ],
        ),
      ),
    );
  }
}
