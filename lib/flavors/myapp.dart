import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';
import 'package:shater/core/controller/root_binding.dart';
import 'package:shater/flavors/env_config.dart';
import 'package:shater/routes/app_routes.dart';

import '../routes/app_pages.dart';
import '../util/constant.dart';
import '../util/messages.dart';
import '../util/theme.dart';
import 'build_config.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  @override
  Widget build(BuildContext context) {
    final EnvConfig _envConfig = BuildConfig.instance.config;
    return ScreenUtilInit(
        designSize: const Size(414, 905), //Size(768, 1024) is sized ipad
        splitScreenMode: true,
        builder: (BuildContext context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeApp.materialLightTheme(),
            defaultTransition: Transition.cupertino,
            initialBinding: RootBinding(),
            // home: DraggableExample(),
            initialRoute: RoutesName.spalshScreen,
            locale: Get.find<LocalizationController>().locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(APPCONSTANT.languages[1].languageCode!,
                APPCONSTANT.languages[1].countryCode),
            getPages: AppPages.routes));
  }
}

class DraggableExample extends StatefulWidget {
  const DraggableExample({Key? key}) : super(key: key);

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  List<String> oldList = ['A', 'B', 'C', 'D'];
  List<String?> newList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: Get.width,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ListView.builder(
                  itemCount: newList.length + oldList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return DragTarget<String>(
                      builder: (BuildContext context, List<String?> accepted,
                          List<dynamic> rejected) {
                        return newList.isEmpty && index >= newList.length
                            ? Container(
                                color: Colors.red,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 70,
                                height: 50,
                              )
                            : Container(
                                width: 70,
                                height: 50,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: newList[index] == null
                                      ? Colors.transparent
                                      : Colors.blue,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: newList[index] == null
                                    ? null
                                    : Text(
                                        newList[index]!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                              );
                      },
                      onWillAcceptWithDetails: (data) => true,
                      onAcceptWithDetails: (data) {
                        setState(() {
                          newList[index] = data.data;
                          oldList.remove(data);
                        });
                      },
                    );
                  },
                ),
              ]),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 80,
              width: Get.width,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ListView.builder(
                  itemCount: oldList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Draggable<String>(
                      data: oldList[index],
                      child: Container(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          border:
                              Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: Text(
                          oldList[index],
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      feedback: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 70,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                          ),
                          child: Text(
                            oldList[index],
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
