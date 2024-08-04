import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/subscription/subjects_subscription_package.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class SubjectSubscriptionScreen extends StatefulWidget {
  const SubjectSubscriptionScreen({
    super.key,
  });

  @override
  State<SubjectSubscriptionScreen> createState() =>
      _SubjectSubscriptionScreenState();
}

class _SubjectSubscriptionScreenState extends State<SubjectSubscriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250.h,
            color: COLORS.primaryColor,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsetsDirectional.only(
                          top: 30.h,
                          start: 30.w,
                        ),
                        height: 46.h,
                        width: 82.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                            Text(
                              "back".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsetsDirectional.only(
                          top: 30.h, start: 30.w, end: 20.w),
                      height: 46.h,
                      // width: 82.w,s
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "season_one".tr,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 100.h,
                  width: 80.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CachedNetworkImageWidget(
                    imageUrl: '',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsetsDirectional.all(10),
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: COLORS.backGroundColor),
                  child: Text(
                    "season_one".tr,
                    style: FontStyleConstant.hNLTBMedium.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                    ),
                  ),
                ),
              ],
            ),
          ),
// List
          TabBar(
            dividerColor: Colors.transparent,
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              _buildTab("الاشتراك".tr, 0),
              _buildTab("الدروس".tr, 1),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SubscriptionWidget(
                  withHeader: true,
                ),
                _lessinesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? COLORS.backGroundColor : COLORS.primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: isSelected ? COLORS.primaryColor : COLORS.backGroundColor,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _lessinesList() {
    return Expanded(
      child: RefreshIndicator.adaptive(
        color: Colors.black,
        onRefresh: () async {
          print("object refreesh");
        },
        child: Padding(
          padding: EdgeInsets.only(top: 0.h, bottom: 20.h),
          child: ListView.separated(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    //onTap: () => Get.to(() => TeacherLessonsforSubject()),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 107.h,
                            width: 81.h,
                            decoration: BoxDecoration(
                              color: Colors.brown.shade300,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child:
                                CachedNetworkImageWidget(imageUrl: "imageUrl"),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "جمع/طرح الأعداد الكلية",
                                style: FontStyleConstant.hNLTBMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSize18),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: COLORS.whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 40.h,
                                    // width: 100.w,
                                    child: Text(
                                      " 37 صفحات ",
                                      style: TextStyle(
                                          color: COLORS.secanderyColor,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: COLORS.secanderyColor,
                              radius: 30.r,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15.h,
                  ),
              itemCount: 10),
        ),
      ),
    );
  }
}

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({
    super.key,
    required this.withHeader,
  });
  final bool withHeader;
  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  int _selectedOption = 1; // 0: None, 1: One Month, 2: Full Term

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          padding: EdgeInsets.all(10),
          // height: 200,
          // alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: COLORS.backGroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ميزات الاشتراك",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                        children: [
                          SvgPicture.asset("assets/icons/check_icon.svg"),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "المحتوى التعليمي الكامل لكل مادة",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 5),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            _selectedOption = 1;
          }),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
            // color: Colors.amber,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: _selectedOption == 1
                  ? COLORS.backGroundColor
                  : COLORS.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 63.h,
            child: Row(
              children: [
                Text(
                  "شهر واحد",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                Spacer(),
                Text(
                  "7.5",
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: () => setState(() {
                _selectedOption = 2;
              }),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
                // color: Colors.amber,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: _selectedOption == 2
                      ? COLORS.backGroundColor
                      : COLORS.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 63.h,
                child: Row(
                  children: [
                    Text(
                      "فصل كامل",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    Spacer(),
                    Text(
                      "30.5",
                      style: TextStyle(color: Colors.white, fontSize: 24.sp),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              start: MediaQuery.sizeOf(context).width / 2.5,
              top: 4,
              child: Container(
                alignment: Alignment.center,
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: COLORS.primaryColor,
                  border: Border.all(color: Colors.white),
                  gradient: _selectedOption == 2
                      ? COLORS.gradientContainer
                      : COLORS.balkContainer,
                ),
                child: Text(
                  "خصم 50 %",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 55.h,
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
            // color: Colors.amber,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              gradient: COLORS.gradientContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "اشترك في العلوم",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
        ),
        Visibility(
          visible: widget.withHeader,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: GestureDetector(
              onTap: () => Get.to(() => SubjectsSubscriptionPackageScreen()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "أو اشترك بجميع المواد واحصل على خصم 50%",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
