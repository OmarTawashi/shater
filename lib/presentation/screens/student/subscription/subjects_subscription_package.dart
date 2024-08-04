import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/student/subject/widgets/custom_appbar.dart';
import 'package:shater/presentation/screens/student/subscription/subscription_screen.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class SubjectsSubscriptionPackageScreen extends StatefulWidget {
  const SubjectsSubscriptionPackageScreen({super.key});

  @override
  State<SubjectsSubscriptionPackageScreen> createState() =>
      _SubjectsSubscriptionPackageScreenState();
}

class _SubjectsSubscriptionPackageScreenState
    extends State<SubjectsSubscriptionPackageScreen>
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
          CustomAppBar(
            boxTitle: "باقة المواد",
            backButtonTitle: "رجوع",
            appbarHight: 500,
          ),
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
                  withHeader: false,
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
                            onTap: index == 0
                                ? () {}
                                : () {
                                    _tabController.index = 0;
                                    setState(() {});
                                  },
                            child: index == 0
                                ? CircleAvatar(
                                    backgroundColor: COLORS.secanderyColor,
                                    radius: 30.r,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    backgroundColor: COLORS.secanderyColor,
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: COLORS.disabledColor,
                    height: 3.h,
                  ),
              itemCount: 4),
        ),
      ),
    );
  }
}
