import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/routes/app_routes.dart';

enum ViewType {
  initial,
  loading,
  shimmer,
  success,
  error,
  noInternet,
  internalServarError,
  custom,
  notFound,
  noStores,
  noOrders,
  empty,
}

class BaseController extends GetxController {
  ViewType viewType = ViewType.initial;
  String errorStr = '';

  updateViewType(ViewType vt) {
    viewType = vt;
    update();
  }

  handelError(ApiException response) {
    errorStr = response.message;
    switch (response.statusCode) {
      case 400:
        updateViewType(ViewType.noInternet);
        break;
      case 401:
        if (Get.currentRoute != Routes.getBaseLoginScreen()) {
          Get.offAllNamed(Routes.getBaseLoginScreen());
        }
        break;
      case 403:
        return const Text('UnauthorisedException');
      case 404:
        updateViewType(ViewType.notFound);
        break;
      case 500:
        updateViewType(ViewType.internalServarError);
        break;
      default:
        if (response.message == 'no_internet_connection'.tr) {
          updateViewType(ViewType.noInternet);
        } else {
          updateViewType(ViewType.error);
        }
    }
  }
}
