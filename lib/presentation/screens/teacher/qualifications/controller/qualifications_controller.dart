import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/presentation/screens/profile/bindings/profile_binding.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/presentation/screens/profile/view/main_profile_screen.dart';
import 'package:shater/util/assets_manager.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../data/model/qualification_response.dart';
import '../../../../../data/model/qualifications_model.dart';
import 'package:collection/collection.dart';

import '../../../../../data/repository/profile_repository_remote.dart';
import '../../../../../domain/usecase/profile_usecase_imp.dart';

class QualificationsController extends GetxController {
  List<QualificationsModel> localCertificates = [];
  List<QualificationResponse> remoteCertificates = [];

  List<QualificationsModel> localCourses = [];
  List<QualificationResponse> remoteCourses = [];
  ProfileUseCaseImp? _profileUseCaseImp;

  int selectedTabId = 0;

  bool isChangeCertificateName = false;

  bool isChangeCourseName = false;

  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _profileUseCaseImp =
        ProfileUseCaseImp(ProfileRepositoryRemote(ApiClient()));
    init();
  }

  void changeSelectedTab(int id) {
    selectedTabId = id;
    update();
  }

  bool isCertificatesEnable() {
    bool isNotEmpty = localCertificates.isNotEmpty;
    bool isEnable = (isNotEmpty && haveEmptyCertificate());

    return isEnable;
  }

  bool isCoursesEnable() {
    bool isNotEmpty = localCourses.isNotEmpty;
    bool isEnable = (isNotEmpty && haveEmptyCourse());
    return isEnable;
  }

  bool haveEmptyCertificate() {
    bool isEnable = true;
    for (QualificationsModel model in localCertificates) {
      if (model.file == null ||
          model.textEditingController.text.trim().isEmpty) {
        isEnable = false;
        return isEnable;
      }
    }
    return isEnable;
  }

  bool haveEmptyCourse() {
    bool isEnable = true;
    for (QualificationsModel model in localCourses) {
      if (model.file == null ||
          model.textEditingController.text.trim().isEmpty) {
        isEnable = false;
        return isEnable;
      }
    }
    return isEnable;
  }

  void init() {
    for (QualificationResponse qul
        in Get.find<ProfileController>().qualifications) {
      if (qul.type == 1) {
        remoteCertificates.add(qul);
      } else if (qul.type == 2) {
        remoteCourses.add(qul);
      }
    }
  }
  setCertificates(){
    remoteCertificates.clear();
    localCertificates.clear();
    for (QualificationResponse qul
    in Get.find<ProfileController>().qualifications) {
      if (qul.type == 1) {
        remoteCertificates.add(qul);
      }
    }
  }

  setCourses(){
    remoteCourses.clear();
    localCourses.clear();
    for (QualificationResponse qul
    in Get.find<ProfileController>().qualifications) {
      if (qul.type == 1) {
        remoteCertificates.add(qul);
      }
    }
  }

  void deleteQualification(QualificationsModel qualification) {
    localCertificates.remove(qualification);
    update();
  }

  void newQualification() {
    QualificationsModel model = QualificationsModel(
      file: null,
      name: null,
    );
    localCertificates.add(model);
    update();
  }

  void deleteCourse(QualificationsModel qualification) {
    localCourses.remove(qualification);
    update();
  }

  void newCourse() {
    QualificationsModel model = QualificationsModel(
      file: null,
      name: null,
    );
    localCourses.add(model);
    update();
  }

  selectFileFromDevice(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video );
    File file;
    if (result != null) {
      file = File(result.files.single.path!);
      if (selectedTabId == 0) {
        localCertificates[index].file = file;
        localCertificates[index].setEditingController(result.files.single.name);
      } else {
        localCourses[index].file = file;
        localCourses[index].setEditingController(result.files.single.name);
      }
      update();
    }
  }

  uploadCertificateFile() async {
    setIsLoading(true);
    Future.forEach<QualificationsModel>(localCertificates, (qul) async {
      await teacherAddQualifications(qul, 1, onResponse: () {});
    }).then((onValue) async {
      await Get.find<ProfileController>().getTeacherQualifications().then((onValue) async {
        await setCertificates();
        setIsLoading(false);
      });
    });
  }

  Future<void> uploadCourseFile() async {
    setIsLoading(true);
    Future.forEach<QualificationsModel>(localCourses, (qul) async {
      await teacherAddQualifications(qul, 2, onResponse: () {});
    }).then((onValue) async {
      await Get.find<ProfileController>().getTeacherQualifications().then((onValue) async {
        setCourses();
        setIsLoading(false);
      });
    });
  }

  Future<void> teacherAddQualifications(QualificationsModel qul, int type,
      {required Function onResponse}) async {
    try {
      await _profileUseCaseImp
          ?.teacherAddQualifications(
              id: SharedPrefs.user?.id ?? 0,
              file: qul.file!,
              onResponse: () {},
              mapDta: qul.getData(type))
          /*.then((value) async {
        // value?.fold((l) {
        //   log("teacherAddQualifications left : ${l.message}");
        // }, (r) {
        //   log("teacherAddQualifications success");
        // });
      })*/;
    } on Exception catch (e) {
      log("teacherAddQualifications e : $e");
    }
  }
}
