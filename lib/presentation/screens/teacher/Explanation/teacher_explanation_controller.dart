import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/SubjectPagesModel.dart';
import 'package:shater/data/repository/dashboard_repository_remote.dart';
import 'package:shater/data/repository/teacher_repository_remote.dart';
import 'package:shater/domain/usecase/dachboard_usercase_imp.dart';
import 'package:shater/domain/usecase/teacher_usecase_imp.dart';

import '../../../../data/model/class_model.dart';
import '../../../../data/model/course_learning_model.dart';
import '../../../../data/model/drawing_point.dart';
import '../../../../data/model/explanation_type_model.dart';
import '../../../../data/repository/public_repository_remote.dart';
import '../../../../domain/usecase/public_usecase_imp.dart';
import '../teacher dashborad/controller/teacher_dashboard_controller.dart';

class TeacherExplanationController extends BaseController {
  DashBaoardUseCaseImp? _dashBaoardUseCaseImp;
  PublicUseCaseImp? _publicUseCaseImp;
  TeacherUseCaseImp? _teacherUseCaseImp;
  List<CourseLearningModel> _subjects = [];
  List<ExplanationTypeModel> _explanationType = [];

  List<ExplanationTypeModel> get explanationType => _explanationType;

  List<CourseLearningModel> get subjects => _subjects;
  List<Classes> _classes = [];

  List<Classes> get classes => _classes;
  SubjectPagesModel subjectPagesModel = SubjectPagesModel();

  @override
  void onInit() {
    super.onInit();
    print('TeacherExplanationController :: HELLO');

    initExplanationTypeList();
    _dashBaoardUseCaseImp = DashBaoardUseCaseImp(
      DashBoardRepositoryRemote(
        ApiClient(),
      ),
    );
    _publicUseCaseImp = PublicUseCaseImp(
      PublicRepositoryRemote(
        ApiClient(),
      ),
    );
    _teacherUseCaseImp = TeacherUseCaseImp(
      TeacherRepositoryRemote(
        ApiClient(),
      ),
    );
    teacherCoursesList();
  }

  Classes? getClassForItem(int? id) {
    return this.classes.firstWhere((element) => element.id == '$id');
  }

  void teacherCoursesList() async {
    final dashController = Get.find<TeacherDashBoardController>();
    updateViewType(ViewType.loading);
    await _dashBaoardUseCaseImp
        ?.teacherCoursesList(dashController.level?.id ?? -1)
        .then(
      (value) {
        value?.fold(
          (l) {
            updateViewType(ViewType.error);
          },
          (s) {
            if (s.isEmpty) {
              updateViewType(ViewType.empty);
            } else {
              updateViewType(ViewType.success);
              _subjects = s;
            }
          },
        );
        update();
      },
    );
  }

  getTeacherCoursesExercisesList({required int course_id}) async {
    updateViewType(ViewType.loading);
    await _teacherUseCaseImp
        ?.getTeacherCoursesExercisesList(course_id: course_id)
        .then(
      (value) {
        value?.fold(
          (l) {
            updateViewType(ViewType.error);
          },
          (s) async {
            if (s.items!.isEmpty) {
              updateViewType(ViewType.empty);
            } else {
              subjectPagesModel = await s;
              updateViewType(ViewType.success);
              update();
            }
          },
        );
        update();
      },
    );
  }

  initExplanationTypeList() {
    _explanationType = [
      ExplanationTypeModel(title: 'page'),
      ExplanationTypeModel(title: 'video'),
      ExplanationTypeModel(title: 'board', isSelected: true),
    ];
    pageController = PageController(initialPage: 2);
    requestPermissions();
  }

  PageController pageController = PageController();

  changeSelectedExplanationType(int index) {
    for (int i = 0; i < 3; i++) {
      _explanationType[i].isSelected = false;

      if (i == index) {
        _explanationType[i].isSelected = true;
      }
      pageController.jumpToPage(index);
    }
    update();
  }

  late List<CameraDescription>? camera;
  int cameraPos = 0;
  late CameraController camera_Controller;

  setCameraDescription(List<CameraDescription> cameraData) {
    camera = cameraData;
    initCamera();
    update();
  }

  Future initCamera() async {
    if (camera!.isNotEmpty) {
      camera_Controller =
          CameraController(camera![cameraPos]!, ResolutionPreset.high);
      try {
        await camera_Controller.initialize().then((v) {
          update();

          return;
        });
      } on CameraException catch (e) {
        print('CameraException :: ${e.toString()}');
      }
    } else {}
  }

  Future<void> requestPermissions() async {
    if (await Permission.storage.isGranted != true) {
      await [Permission.storage].request();
    }
  }

  var avaiableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];

  var boardHistoryDrawingPoints = <DrawingPoint>[];
  var boardDrawingPoints = <DrawingPoint>[];

  var boardSelectedColor = Colors.black;
  var boardSelectedWidth = 2.0;

  DrawingPoint? boardCurrentDrawingPoint;

  var pageHistoryDrawingPoints = <DrawingPoint>[];
  var pageDrawingPoints = <DrawingPoint>[];

  var pageSelectedColor = Colors.black;
  var pageSelectedWidth = 2.0;

  DrawingPoint? currentPageDrawingPoint;

  bool isEditingPen = false;

  // bool isRecordingVideo = false;
  bool canPaintPage = false;
  bool canPaintBoard = false;

  bool recording = false;
  bool exporting = false;

  startDrawing(String type, var details) {
    if (type == 'board') {
      if (!recording) return;
      if (!canPaintBoard) return;

      isEditingPen = false;

      boardCurrentDrawingPoint = DrawingPoint(
        id: DateTime.now().microsecondsSinceEpoch,
        offsets: [
          details.localPosition,
        ],
        color: boardSelectedColor,
        width: boardSelectedWidth,
      );

      if (boardCurrentDrawingPoint == null) return;
      boardDrawingPoints.add(boardCurrentDrawingPoint!);
      boardHistoryDrawingPoints = List.of(boardDrawingPoints);
    } else if (type == 'page') {
      if (!recording) return;
      if (!canPaintPage) return;
      isEditingPen = false;
      currentPageDrawingPoint = DrawingPoint(
        id: DateTime.now().microsecondsSinceEpoch,
        offsets: [
          details.localPosition,
        ],
        color: pageSelectedColor,
        width: pageSelectedWidth,
      );

      if (currentPageDrawingPoint == null) return;
      pageDrawingPoints.add(currentPageDrawingPoint!);
      pageHistoryDrawingPoints = List.of(pageDrawingPoints);
    }
    update();
  }

  updateDrawing(String type, var details) {
    if (type == 'board') {
      if (!recording) return;
      if (!canPaintBoard) return;

      if (boardCurrentDrawingPoint == null) return;

      boardCurrentDrawingPoint = boardCurrentDrawingPoint?.copyWith(
        offsets: boardCurrentDrawingPoint!.offsets..add(details.localPosition),
      );
      boardDrawingPoints.last = boardCurrentDrawingPoint!;
      boardHistoryDrawingPoints = List.of(boardDrawingPoints);
    } else if (type == 'page') {
      if (!recording) return;
      if (!canPaintPage) return;

      if (currentPageDrawingPoint == null) return;

      currentPageDrawingPoint = currentPageDrawingPoint?.copyWith(
        offsets: currentPageDrawingPoint!.offsets..add(details.localPosition),
      );
      pageDrawingPoints.last = currentPageDrawingPoint!;
      pageHistoryDrawingPoints = List.of(pageDrawingPoints);
    }
    update();
  }

  endDrawing(String type) {
    if (type == 'board') {
      if (!recording) return;
      if (!canPaintBoard) return;

      boardCurrentDrawingPoint = null;
    } else if (type == 'page') {
      if (!recording) return;
      if (!canPaintPage) return;
      currentPageDrawingPoint = null;
    }
    update();
  }

  unDoPaint() {
    if (explanationType[2].isSelected) {
      if (boardDrawingPoints.isNotEmpty &&
          boardHistoryDrawingPoints.isNotEmpty) {
        boardDrawingPoints.removeLast();
      }
    } else if (explanationType[0].isSelected) {
      if (pageDrawingPoints.isNotEmpty && pageHistoryDrawingPoints.isNotEmpty) {
        pageDrawingPoints.removeLast();
      }
    }
    update();
  }

  reDoPaint() {
    if (explanationType[2].isSelected) {
      if (boardDrawingPoints.length < boardHistoryDrawingPoints.length) {
        final index = boardDrawingPoints.length;
        boardDrawingPoints.add(boardHistoryDrawingPoints[index]);
      }
    } else if (explanationType[0].isSelected) {
      if (pageDrawingPoints.length < pageHistoryDrawingPoints.length) {
        final index = pageDrawingPoints.length;
        pageDrawingPoints.add(pageHistoryDrawingPoints[index]);
      }
    }
    update();
  }

  eraseDraw() {
    if (explanationType[2].isSelected) {
      boardDrawingPoints.clear();
    } else if (explanationType[0].isSelected) {
      pageDrawingPoints.clear();
    }
    update();
  }

  enableDraw() {
    isEditingPen = true;
    if (explanationType[2].isSelected) {
      canPaintBoard = true;
    } else if (explanationType[0].isSelected) {
      canPaintPage = true;
    }
    update();
  }

  disableDraw() {
    if (explanationType[2].isSelected) {
      canPaintBoard = false;
    } else if (explanationType[0].isSelected) {
      canPaintPage = false;
    }
    update();
  }
}
